pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__run_mixins.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__run_mixins.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E073 : Short_Integer; pragma Import (Ada, E073, "system__os_lib_E");
   E011 : Short_Integer; pragma Import (Ada, E011, "system__soft_links_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__exception_table_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "ada__io_exceptions_E");
   E053 : Short_Integer; pragma Import (Ada, E053, "ada__strings_E");
   E038 : Short_Integer; pragma Import (Ada, E038, "ada__containers_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__exceptions_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "ada__strings__maps_E");
   E059 : Short_Integer; pragma Import (Ada, E059, "ada__strings__maps__constants_E");
   E043 : Short_Integer; pragma Import (Ada, E043, "interfaces__c_E");
   E019 : Short_Integer; pragma Import (Ada, E019, "system__soft_links__initialize_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "system__object_reader_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "system__dwarf_lines_E");
   E037 : Short_Integer; pragma Import (Ada, E037, "system__traceback__symbolic_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "ada__tags_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "ada__streams_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "system__file_control_block_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "system__finalization_root_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "ada__finalization_E");
   E109 : Short_Integer; pragma Import (Ada, E109, "system__file_io_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "system__storage_pools_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "system__finalization_masters_E");
   E105 : Short_Integer; pragma Import (Ada, E105, "ada__text_io_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "base_iface_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "base_type_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "generic_mixin_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "generic_mixin_compositor_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "oop_mixin_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "oop_mixin_compositor_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E128 := E128 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "oop_mixin_compositor__finalize_spec");
      begin
         F1;
      end;
      E130 := E130 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "oop_mixin__finalize_spec");
      begin
         F2;
      end;
      E126 := E126 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "generic_mixin_compositor__finalize_spec");
      begin
         F3;
      end;
      E122 := E122 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "base_type__finalize_spec");
      begin
         F4;
      end;
      E105 := E105 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "ada__text_io__finalize_spec");
      begin
         F5;
      end;
      E116 := E116 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "system__finalization_masters__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "system__file_io__finalize_body");
      begin
         E109 := E109 - 1;
         F7;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E023 := E023 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E068 := E068 + 1;
      Ada.Strings'Elab_Spec;
      E053 := E053 + 1;
      Ada.Containers'Elab_Spec;
      E038 := E038 + 1;
      System.Exceptions'Elab_Spec;
      E025 := E025 + 1;
      System.Os_Lib'Elab_Body;
      E073 := E073 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E059 := E059 + 1;
      Interfaces.C'Elab_Spec;
      System.Soft_Links.Initialize'Elab_Body;
      E019 := E019 + 1;
      E011 := E011 + 1;
      E055 := E055 + 1;
      E043 := E043 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      E048 := E048 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E037 := E037 + 1;
      E079 := E079 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E099 := E099 + 1;
      Ada.Streams'Elab_Spec;
      E097 := E097 + 1;
      System.File_Control_Block'Elab_Spec;
      E113 := E113 + 1;
      System.Finalization_Root'Elab_Spec;
      E112 := E112 + 1;
      Ada.Finalization'Elab_Spec;
      E110 := E110 + 1;
      System.File_Io'Elab_Body;
      E109 := E109 + 1;
      System.Storage_Pools'Elab_Spec;
      E120 := E120 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E116 := E116 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E105 := E105 + 1;
      base_iface'elab_spec;
      E114 := E114 + 1;
      base_type'elab_spec;
      base_type'elab_body;
      E122 := E122 + 1;
      E124 := E124 + 1;
      generic_mixin_compositor'elab_spec;
      generic_mixin_compositor'elab_body;
      E126 := E126 + 1;
      oop_mixin'elab_spec;
      oop_mixin'elab_body;
      E130 := E130 + 1;
      oop_mixin_compositor'elab_spec;
      oop_mixin_compositor'elab_body;
      E128 := E128 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_run_mixins");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /home/gerr/comp/kdevel/ada_composition/mixins/obj/dbg/base_iface.o
   --   /home/gerr/comp/kdevel/ada_composition/mixins/obj/dbg/base_type.o
   --   /home/gerr/comp/kdevel/ada_composition/mixins/obj/dbg/generic_mixin.o
   --   /home/gerr/comp/kdevel/ada_composition/mixins/obj/dbg/generic_mixin_compositor.o
   --   /home/gerr/comp/kdevel/ada_composition/mixins/obj/dbg/oop_mixin.o
   --   /home/gerr/comp/kdevel/ada_composition/mixins/obj/dbg/oop_mixin_compositor.o
   --   /home/gerr/comp/kdevel/ada_composition/mixins/obj/dbg/run_mixins.o
   --   -L/home/gerr/comp/kdevel/ada_composition/mixins/obj/dbg/
   --   -L/home/gerr/comp/kdevel/ada_composition/mixins/obj/dbg/
   --   -L/usr/lib/gcc/x86_64-pc-linux-gnu/7.3.1/adalib/
   --   -static
   --   -lgnat
   --   -ldl
--  END Object file/option list   

end ada_main;
