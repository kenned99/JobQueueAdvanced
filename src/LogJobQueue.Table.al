table 50244 "cor LogJobQueue"
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "cor Log Job Queue Status"; enum "cor Log Job Queue Status")
        {
        }
        field(3; Description; Text[250])
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
        field(7; "Error Message"; Blob)
        {
        }
        field(8; ID; Guid)
        {
            TableRelation = "Job Queue Entry";
        }
        field(9; ErrPreview; Text[250])
        {
        }
        field(10; Code10; Code[10])
        {
        }
    }
    keys
    {
        key(Key1; "Entry No.", Code10)
        {
            Clustered = true;
        }
    }
}