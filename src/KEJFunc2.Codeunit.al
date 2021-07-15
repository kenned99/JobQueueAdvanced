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
    begin
        myInt_loc := 2 + 9;
        Message(Format(myInt_loc));

        status := Status::Success;
        desc := 'C50245 kørt';
        Err := 'Ingen fejl';

        JobSubtaskLog_loc.CreateLog(Rec, desc, Err, Status);

    end;
}