table 50244 "cor LogJobQueue"
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
        }

        field(2; "cor Log Job Queue Status"; enum "cor Log Job Queue Status")
        {
        }
        field(3; Description; Text[100])
        {
        }
        field(4; "User ID"; Text[65])
        {
        }
        field(5; "Earliest Start Date/Time"; DateTime)
        {
        }
        field(6; "Expiration Date/Time"; DateTime)
        {
        }
        field(7; "Error Message"; Text[100])
        {
        }
        field(8; ID; Guid)
        {
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}