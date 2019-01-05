with Ada.Text_IO;

package body Lists.fixed is

    overriding
    function List_Constant_Reference (Container : aliased in List; Position  : Cursor) return Constant_Reference_Type is
        CR : Constant_Reference_Type(Container.data(Position.Index)'Access);
    begin
        return CR;
    end;
 
    overriding
    function List_Constant_Reference (Container : aliased in List; Index : in Index_Type) return Constant_Reference_Type is
        CR : Constant_Reference_Type(Container.data(Index)'Access);
    begin
        return CR;
    end;
 
    overriding
    function List_Reference (Container : aliased in out List; Position  : Cursor) return Reference_Type is
        R : Reference_Type(Container.data(Position.Index)'Access);
    begin
        return R;
    end;

    overriding
    function List_Reference (Container : aliased in out List; Index : in Index_Type) return Reference_Type is
        R : Reference_Type(Container.data(Index)'Access);
    begin
        return R;
    end;

    overriding
    function Iterate (Container : in List) return Iterator_Interface'Class is
        It : Iterator := (Container'Unrestricted_Access, Index_Base'First);
    begin
        return It;
    end;


    overriding
    function First (Object : Iterator) return Cursor is
        C : Cursor := (Object.Container, Index_Type'First);
    begin
        return C;
    end;

    overriding 
    function Last  (Object : Iterator) return Cursor is
        C : Cursor := (Object.Container, List(Object.Container.all).Last);
    begin
        return C;
    end;

    overriding 
    function Next (Object   : Iterator; Position : Cursor) return Cursor is
        C : Cursor := (Object.Container, Position.Index + 1);
    begin
        return C;
    end;

    overriding 
    function Previous (Object   : Iterator; Position : Cursor) return Cursor is
        C : Cursor := (Object.Container, Position.Index - 1);
    begin
        return C;
    end;

end Lists.fixed;
