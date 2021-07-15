codeunit 50246 "cor JobSubtaskLog"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    begin

    end;

    procedure CheckLog(ID_par: GUID; Description_par: Text[250]; StartTime_par: datetime; EndTime_par: datetime; ErrMsg_par: Text[250]; Status_par: Enum "cor Log Job Queue Status")
    var
        JobQueueEntry_loc: Record "Job Queue Entry";
        LogJobQueue_loc: Record "cor LogJobQueue";
    begin
        // Error
        JobQueueEntry_loc.SetRange(ID, ID_par);
        if Status_par = Status_par::Error then
            repeat
                LogJobQueue_loc.Description := Description_par;
                LogJobQueue_loc."Earliest Start Date/Time" := StartTime_par;
                LogJobQueue_loc."Expiration Date/Time" := EndTime_par;
                LogJobQueue_loc."Error Message" := ErrMsg_par;

                LogJobQueue_loc."cor Log Job Queue Status" := Status_par::Error;
                LogJobQueue_loc.insert(true);
                Message('daw');
            until JobQueueEntry_loc.Next() = 0;

        // In Process



        // Success
        if Status_par = Status_par::Success then
            repeat
                LogJobQueue_loc.Description := Description_par;
                LogJobQueue_loc."Earliest Start Date/Time" := StartTime_par;
                LogJobQueue_loc."Expiration Date/Time" := EndTime_par;
                LogJobQueue_loc."Error Message" := ErrMsg_par;

                LogJobQueue_loc."cor Log Job Queue Status" := Status_par::Success;
                LogJobQueue_loc.insert(true);
                Message('sucsssæs');
            until JobQueueEntry_loc.Next() = 0;


        IF not JobQueueEntry_loc.IsEmpty then begin
            Message('haj');
        end;
    end;

    procedure CreateLog(Rec_par: Record "Job Queue Entry"; Desc: Text; Err: Text; Status_par: Enum "cor Log Job Queue Status")
    var
        LogJobQueue_loc: Record "cor LogJobQueue";

    begin
        if Status_par = Status_par::Error then begin
            LogJobQueue_loc."Earliest Start Date/Time" := Rec_par."Earliest Start Date/Time";
            LogJobQueue_loc."Expiration Date/Time" := Rec_par."Expiration Date/Time";
            LogJobQueue_loc."User ID" := Rec_par."User ID";

            LogJobQueue_loc."cor Log Job Queue Status" := Status_par::Error;
            LogJobQueue_loc.insert(true);
        end;

        if Status_par = Status_par::"In Process" then begin
            LogJobQueue_loc."Earliest Start Date/Time" := Rec_par."Earliest Start Date/Time";
            LogJobQueue_loc."Expiration Date/Time" := Rec_par."Expiration Date/Time";
            LogJobQueue_loc."User ID" := Rec_par."User ID";

            LogJobQueue_loc."cor Log Job Queue Status" := Status_par::"In Process";
            LogJobQueue_loc.insert(true);
        end;

        if Status_par = Status_par::Success then begin
            LogJobQueue_loc.ID := Rec_par.ID;
            LogJobQueue_loc."Earliest Start Date/Time" := Rec_par."Earliest Start Date/Time";
            LogJobQueue_loc."Expiration Date/Time" := Rec_par."Expiration Date/Time";
            LogJobQueue_loc."User ID" := Rec_par."User ID";

            LogJobQueue_loc."cor Log Job Queue Status" := Status_par::Success;
            LogJobQueue_loc.insert(true);
        end;
    end;
}