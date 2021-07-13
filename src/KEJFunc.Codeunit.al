codeunit 50244 "cor KEJFunc"
{
    trigger OnRun()
    begin
        myInt := 2 + 2;

        If myInt = 4 then
            Message('DAW');

        If myInt = 5 then
            Message('5');
    end;

    var
        myInt: Integer;
}