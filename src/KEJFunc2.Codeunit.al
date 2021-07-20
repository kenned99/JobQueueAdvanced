codeunit 50245 "cor KEJFunc2"
{
    TableNo = "Job Queue Entry";
    trigger OnRun()
    var
        JobSubtaskLog_loc: Codeunit "cor JobSubtaskLog";
        temblob_loc: Codeunit "Temp Blob";

        myInt_loc: Integer;
        Status_loc: Enum "cor Log Job Queue Status";
        desc_loc: Text[250];
        Err_loc: text;
        OutStream_loc: OutStream;
    begin
        myInt_loc := 2 + 9;
        Message(Format(myInt_loc));

        status_loc := Status_loc::Success;
        desc_loc := 'C50245 kørt';
        Err_loc := 'Ingen fejl';

        temblob_loc.CreateOutStream(OutStream_loc);
        OutStream_loc.Write('kejfunc 2 kljkljsad32080932483248932234jlsdfkljsdkljfsdf8023434jsfdljlsdfkljsfdkljskljfdsjdf803208skljdfkljsfd032fksdf70j5409v6534b0734h0986h7h45986g6g78934g78979etrueyetryeryetry');
        JobSubtaskLog_loc.CreateLog(Rec, desc_loc, Status_loc, temblob_loc);
    end;
}