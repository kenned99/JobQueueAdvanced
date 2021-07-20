codeunit 50246 "cor JobSubtaskLog"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    begin

    end;

    procedure CreateLog(Rec_par: Record "Job Queue Entry"; Desc_par: Text[250]; Status_par: Enum "cor Log Job Queue Status"; ErrorMessage_par: Codeunit "Temp Blob")
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
            LogJobQueue_loc."cor Log Job Queue Status" := Status_par::Error;

            //Error Message BLOB & Error Preview
            if ErrorMessage_par.HasValue() then begin
                ErrorMessage_par.CreateInStream(InStream_loc); //læser streamen ud
                LogJobQueue_loc."Error Message".CreateOutStream(OutStream_loc); //danner referance således man kan skrive 
                InStream_loc.ReadText(LogJobQueue_loc.ErrPreview, MaxStrLen(LogJobQueue_loc.ErrPreview)); //Preview
                CopyStream(OutStream_loc, InStream_loc); //Kopier og ligger over i InStream
            end;
            LogJobQueue_loc.insert(true);
        end;
        //In progress
        if Status_par = Status_par::"In Process" then begin
            LogJobQueue_loc."Earliest Start Date/Time" := Rec_par."Earliest Start Date/Time";
            LogJobQueue_loc."Expiration Date/Time" := Rec_par."Expiration Date/Time";
            LogJobQueue_loc."User ID" := Rec_par."User ID";
            LogJobQueue_loc.Description := Desc_par;
            LogJobQueue_loc."cor Log Job Queue Status" := Status_par::"In Process";

            //Error Message BLOB & Error Preview
            if ErrorMessage_par.HasValue() then begin
                ErrorMessage_par.CreateInStream(InStream_loc);
                LogJobQueue_loc."Error Message".CreateOutStream(OutStream_loc);
                InStream_loc.ReadText(LogJobQueue_loc.ErrPreview, MaxStrLen(LogJobQueue_loc.ErrPreview));
                CopyStream(OutStream_loc, InStream_loc);
            end;
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

            //Error Message BLOB & Error Preview
            if ErrorMessage_par.HasValue() then begin
                ErrorMessage_par.CreateInStream(InStream_loc);
                LogJobQueue_loc."Error Message".CreateOutStream(OutStream_loc);
                InStream_loc.ReadText(LogJobQueue_loc.ErrPreview, MaxStrLen(LogJobQueue_loc.ErrPreview));
                CopyStream(OutStream_loc, InStream_loc);
            end;
            LogJobQueue_loc.insert(true);
        end;
    end;
}