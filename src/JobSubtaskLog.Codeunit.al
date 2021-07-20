codeunit 50246 "cor JobSubtaskLog"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    begin

    end;

    procedure CreateLog(Rec_par: Record "Job Queue Entry"; Desc_par: Text; Status_par: Enum "cor Log Job Queue Status"; ErrorMessage_par: Codeunit "Temp Blob")
    var
        LogJobQueue_loc: Record "cor LogJobQueue";
        InStream_loc: InStream;
        OutStream_loc: OutStream;


    begin
        //Error
        if Status_par = Status_par::Error then begin
            LogJobQueue_loc."Earliest Start Date/Time" := Rec_par."Earliest Start Date/Time";
            LogJobQueue_loc."Expiration Date/Time" := Rec_par."Expiration Date/Time";
            LogJobQueue_loc."User ID" := Rec_par."User ID";

            LogJobQueue_loc.Description := Desc_par;

            if ErrorMessage_par.HasValue() then begin
                ErrorMessage_par.CreateInStream(InStream_loc); //læser strema ud
                LogJobQueue_loc."Error Message".CreateOutStream(OutStream_loc); //danner referenace således man kan skrivce 
                InStream_loc.ReadText(LogJobQueue_loc.ErrPreview, MaxStrLen(LogJobQueue_loc.ErrPreview));
                CopyStream(OutStream_loc, InStream_loc); //Kopi og ligger over i instream
            end;
            LogJobQueue_loc."cor Log Job Queue Status" := Status_par::Error;
            LogJobQueue_loc.insert(true);
        end;

        //In progress
        if Status_par = Status_par::"In Process" then begin
            LogJobQueue_loc."Earliest Start Date/Time" := Rec_par."Earliest Start Date/Time";
            LogJobQueue_loc."Expiration Date/Time" := Rec_par."Expiration Date/Time";
            LogJobQueue_loc."User ID" := Rec_par."User ID";

            LogJobQueue_loc.Description := Desc_par;

            LogJobQueue_loc."cor Log Job Queue Status" := Status_par::"In Process";
            LogJobQueue_loc.insert(true);
        end;

        //Success
        if Status_par = Status_par::Success then begin
            LogJobQueue_loc.ID := Rec_par.ID;
            LogJobQueue_loc."Earliest Start Date/Time" := Rec_par."Earliest Start Date/Time";
            LogJobQueue_loc."Expiration Date/Time" := Rec_par."Expiration Date/Time";
            LogJobQueue_loc."User ID" := Rec_par."User ID";

            LogJobQueue_loc.Description := Desc_par;

            LogJobQueue_loc."cor Log Job Queue Status" := Status_par::Success;
            LogJobQueue_loc.insert(true);
        end;


    end;
}