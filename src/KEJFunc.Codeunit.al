codeunit 50244 "cor KEJFunc"
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
        InStream_loc: InStream;
        TempBLOB_loc: Codeunit "Temp Blob";
        LogJobQueue_loc: Record "cor LogJobQueue";
        temblob_loc: Codeunit "Temp Blob";
        txt1: Text;
        StreamOut: OutStream;
        txt2: Text;
        StreamIn: InStream;
    begin
        myInt_loc := 2 + 2;

        If myInt_loc = 4 then
            Message('DAW');

        If myInt_loc = 5 then
            Message('5');

        if myInt_loc = 4 then
            sucsses := true;

        if sucsses then
            KEJFunc2_loc.Run(Rec);


        status := Status::Error;
        desc := 'Hej med dig';
        Err := 'FEJL VED C50024';

        txt1 := 'Lorem ipsum dolor sit amet, conskljsadkljsadkljasdsadklj444ectetur adipiscing elit. Integer convallis, erat non venenatis dignissim, velit odio rutrum neque, et mattis ligula dui id lacus. Quisque tempus sed nisi at dignissim. Ut venenatis rutrum justo. Nunc sit amet tempus felis, eget pretium leo. Vestibulum eget dolor in urna mattis cursus. Nullam aliquet vulputate odio in pellentesque. Donec laoreet ipsum vitae scelerisque porta. Nunc est lorem, pellentesque eu ultrices et, sodales vitae ipsum. Fusce vel lorem suscipit, rutrum enim ac, mollis ipsum. Duis sed elit vitae neque imperdiet rhoncus. Suspendisse varius blandit lacinia. Vestibulum ullamcorper tortor quis justo egestas, sit amet gravida odio sagittis. Vivamus pellentesque tincidunt est vel auctor. Pellentesque elit lorem, tincidunt vitae mattis sit amet, sagittis vel dui. Vestibulum justo nibh, scelerisque quis euismod eu, vulputate ac ex.';

        temblob_loc.CreateOutStream(OutStream_loc);

        OutStream_loc.Write(txt1);

        JobSubtaskLog_loc.CreateLog(Rec, desc, Status, temblob_loc);


    end;
}