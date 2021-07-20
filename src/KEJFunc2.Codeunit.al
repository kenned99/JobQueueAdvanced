codeunit 50245 "cor KEJFunc2"
{
    TableNo = "Job Queue Entry";
    trigger OnRun()
    var
        myInt_loc: Integer;
        KEJFunc2_loc: Codeunit "cor KEJFunc2";
        sucsses: Boolean;
        JobQueueEntry_loc: Record "Job Queue Entry";
        JobSubtaskLog_loc: Codeunit "cor JobSubtaskLog";
        Status: Enum "cor Log Job Queue Status";
        desc: Text;
        Err: text;
        OutStream_loc: OutStream;
        InStr_loc: InStream;
        temblob_loc: Codeunit "Temp Blob";
    begin
        myInt_loc := 2 + 9;
        Message(Format(myInt_loc));

        status := Status::Success;
        desc := 'C50245 kørt';
        Err := 'Ingen fejl';


        temblob_loc.CreateOutStream(OutStream_loc);

        OutStream_loc.Write('kejfunc 2 kljkljsad32080932483248932234jlsdfkljsdkljfsdf8023434jsfdljlsdfkljsfdkljskljfdsjdf803208skljdfkljsfd032fksdf70j5409v6534b0734h0986h7h45986g6g78934g78979etrueyetryeryetry');

        JobSubtaskLog_loc.CreateLog(Rec, desc, Status, temblob_loc);
        //JobSubtaskLog_loc.CreateLog(Rec, desc, Status, InStr_loc);


    end;
}