codeunit 50244 "cor KEJFunc"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    var
        myInt_loc: Integer;
        KEJFunc2_loc: Codeunit "cor KEJFunc2";
        sucsses: Boolean;
        JobQueueEntry_loc: Record "Job Queue Entry";
    begin
        myInt_loc := 2 + 2;

        If myInt_loc = 4 then
            Message('DAW');

        If myInt_loc = 5 then
            Message('5');

        if myInt_loc = 4 then
            sucsses := true;

        if sucsses then
            KEJFunc2_loc.Run();

        if not sucsses then begin
            JobQueueEntry_loc.Status := JobQueueEntry_loc.Status::Error;
            JobQueueEntry_loc.Insert(true);
        end;

    end;
}