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
        field(7; "Error Message"; Text[2048])
        {
        }
        field(8; ID; Guid)
        {
            TableRelation = "Job Queue Entry";
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
    var
        JobQueueEntry_loc: Record "Job Queue Entry";
        NoSeriesManagement_loc: Codeunit NoSeriesManagement;
    begin
        /*  JobQueueEntry_loc.SetRange(ID, ID);
          //SetRange(ID, JobQueueEntry_loc.ID);

          Description := JobQueueEntry_loc.Description;
          "User ID" := JobQueueEntry_loc."User ID";
          "Earliest Start Date/Time" := JobQueueEntry_loc."Earliest Start Date/Time";
          "Expiration Date/Time" := JobQueueEntry_loc."Expiration Date/Time";

        IF "Entry No." = '' THEN
            "Entry No." := NoSeriesManagement_loc.GetNextNo('JOBSUBTASK', WORKDATE, TRUE);*/



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