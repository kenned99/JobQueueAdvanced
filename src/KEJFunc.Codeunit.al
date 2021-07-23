codeunit 50244 "cor KEJFunc"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    var
        KEJFunc2_loc: Codeunit "cor KEJFunc2";
        temblob_loc: Codeunit "Temp Blob";
        JobSubtaskLog_loc: Codeunit "cor JobSubtaskLog";

        myInt_loc: Integer;
        sucsses_loc: Boolean;
        Status_loc: Enum "cor Log Job Queue Status";
        desc_loc: Text[250];
        Err_loc: text;
        OutStream_loc: OutStream;
        txt1_loc: Text;
        code10_loc: Code[10];
    begin
        // myInt_loc := 2 + 2;
        // sucsses_loc := true;

        // If myInt_loc = 4 then
        //     Message('DAW');

        // If myInt_loc = 5 then
        //     Message('5');

        // if myInt_loc = 4 then
        //     sucsses_loc := true;

        // if sucsses_loc then        


        status_loc := Status_loc::"In Process";
        desc_loc := 'Hej med dig';
        Err_loc := 'FEJL VED C50024';
        code10_loc := 'CODE101';
        txt1_loc := 'Lorem ipsum dolor sit amet, conskljsadkljsadkljasdsadklj444ectetur adipiscing elit. Integer convallis, erat non venenatis dignissim, velit odio rutrum neque, et mattis ligula dui id lacus. Quisque tempus sed nisi at dignissim. Ut venenatis rutrum justo. Nunc sit amet tempus felis, eget pretium leo. Vestibulum eget dolor in urna mattis cursus. Nullam aliquet vulputate odio in pellentesque. Donec laoreet ipsum vitae scelerisque porta. Nunc est lorem, pellentesque eu ultrices et, sodales vitae ipsum. Fusce vel lorem suscipit, rutrum enim ac, mollis ipsum. Duis sed elit vitae neque imperdiet rhoncus. Suspendisse varius blandit lacinia. Vestibulum ullamcorper tortor quis justo egestas, sit amet gravida odio sagittis. Vivamus pellentesque tincidunt est vel auctor. Pellentesque elit lorem, tincidunt vitae mattis sit amet, sagittis vel dui. Vestibulum justo nibh, scelerisque quis euismod eu, vulputate ac ex.';

        temblob_loc.CreateOutStream(OutStream_loc);
        OutStream_loc.Write(txt1_loc);


        JobSubtaskLog_loc.CreateSubtaskLog(Rec, desc_loc, Status_loc, temblob_loc, code10_loc);

        KEJFunc2_loc.Run(Rec);

        //   JobSubtaskLog_loc.CreateLog(Rec, desc_loc, Status_loc, temblob_loc);


    end;
}