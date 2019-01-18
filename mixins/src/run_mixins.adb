--
-- Main routines testing/illustrating  the mixins.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--

with Ada.Command_Line, GNAT.Command_Line;
with Ada.Text_IO, Ada.Integer_Text_IO;
-- with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;


procedure run_mixins is
    procedure printUsage is
        use Ada.Text_IO;
    begin
        Put_Line ("!!!DESCRIPTION!!!");
        New_Line;
        Put_Line ("usage:");
        Put_Line ("   " & Ada.Command_Line.Command_Name & " [-h -g -n: -v]  positional");
        New_Line;
        Put_Line ("options:");
        --  only short options for now
        Put_Line ("-h      print this help");
        Put_Line ("-g      turn on debug output");
        Put_Line ("-v      be verbose");
        Put_Line ("-n      enter some number");
    end printUsage;

    Finish : exception;  -- normal termination
    --  Ada doesn't have an analog of sys.exit() in the standard, because of multitasking
    --  support directly by the language. So just raise this anywhere and catch at the top..
    --
    --  If you really miss this function, OS_Exit/OS_Abort are defined in
    --  GNAT.OS_Lib (one of gnat extensions).  Just be aware that it does not play well with Spawn and other
    --  process-controll features!!

    type ParamRec is record
		--  mostly the commandline params. DepGraph and USE flags will go as separate vars
        name    : Unbounded_String := Null_Unbounded_String;
        workDir : Unbounded_String := Null_Unbounded_String;
        val     : Integer := 0;
        Debug   : Boolean := False;
    end record;

    procedure processCommandLine (params : in out ParamRec) is
        --  this works very similarly to GNU getopt, except this one uses single '-'
        --  for both short and long options
        use Ada.Command_Line, GNAT.Command_Line, Ada.Text_IO, Ada.Integer_Text_IO;
        Options : constant String := "g h n: v";
        Last:Positive;
    begin
        if Argument_Count < 1 then
            printUsage;
            raise Finish;
        end if;
        begin -- need to process local exceptions
            loop
                case Getopt (Options) is
                    when ASCII.NUL =>
                        exit;
                    --  end of option list

                    when 'g' | 'v' => params.Debug := True;
                    when 'h' =>
                        printUsage;
                        raise Finish;

                    when 'n' => Get(Parameter,Positive(params.val),Last);

                    when others =>
                        raise Program_Error;
                        --  serves to catch "damn, forgot to include that option here"
                end case;
            end loop;
        exception
            when Invalid_Switch =>
                Put_Line ("Invalid Switch " & Full_Switch);
                raise Finish;
            when Invalid_Parameter =>
                Put_Line ("No parameter for " & Full_Switch);
                raise Finish;
            when Data_Error =>
                Put_Line ("Invalid numeric format for switch" & Full_Switch);
                raise Finish;
        end;
        -- get positional params
        loop
            declare
                S : constant String := Get_Argument (Do_Expansion => True);
            begin
                exit when S'Length = 0;
                if params.Debug then Put_Line ("alternative file was passed: '" & S &"'"); end if;
                params.name := To_Unbounded_String(S);
            end;
        end loop;
    end processCommandLine;


    params : ParamRec;

    use Ada.Text_IO;

begin  -- main
    processCommandLine (params);
    Put_Line("basic test");
exception
	when Finish => null;
end run_mixins;
