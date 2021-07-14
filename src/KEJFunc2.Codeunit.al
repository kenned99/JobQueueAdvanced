codeunit 50245 "cor KEJFunc2"
{
    trigger OnRun()
    var
        myInt_loc: Integer;

    begin
        myInt_loc := 2 + 9;
        Message(Format(myInt_loc));
    end;
}