package body Iface_Lists.dynamic is

    overriding
    function List_Constant_Reference (Container : aliased in List; Index : Index_Type) return Constant_Reference_Type is
        CVR : ACV.Constant_Reference_Type := Container.vec.Constant_Reference(Index);
        R : Constant_Reference_Type(CVR.Element);
    begin
        return R;
    end;

    overriding
    function List_Constant_Reference (Container : aliased in List; Position  : Cursor) return Constant_Reference_Type is
    begin
        return List_Constant_Reference(Container, Position.Index);
    end;

    overriding
    function List_Reference (Container : aliased in out List; Index : Index_Type) return Reference_Type is
        VR : ACV.Reference_Type := Container.vec.Reference(Index);
        R : Reference_Type(VR.Element);
    begin
        return R;
    end;

    overriding
    function List_Reference (Container : aliased in out List; Position  : Cursor) return Reference_Type is
    begin
        return List_Reference(Container, Position.Index);
    end;

    function To_Vector (Length : Index_Type) return List is
        L : List := (vec => ACV.To_Vector(Ada.Containers.Count_Type(Length)));
    begin
        return L;
    end;

    overriding
    function Iterate (Container : in List) return Iterator_Interface'Class is
        It : Iterator := (Container'Unrestricted_Access, Index_Base'First);
    begin
        return It;
    end;

    function Has_Element (L : List; Position : Index_Base) return Boolean is
    begin
        return ACV.Has_Element(L.vec.To_Cursor(Position));
    end;



    overriding
    function First (Object : Iterator) return Cursor is
        C : Cursor := (Object.Container, Index_Type'First);
    begin
        return C;
    end;

    overriding
    function Last  (Object : Iterator) return Cursor is
        C : Cursor := (Object.Container, List(Object.Container.all).vec.Last_Index);
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


    overriding
    function NElements  (Container : aliased in out List) return Index_Base is
    begin
        return Index_Base(Container.vec.Length);
    end;

    overriding
    function First_Index(Container : aliased in out List) return Index_Type is
    begin
        return Index_Type'First;
    end;

    overriding
    function Last_Index (Container : aliased in out List) return Index_Type is
    begin
        return Index_Type'First + Index_Base(Container.vec.Length);
    end;


end Iface_Lists.dynamic;
