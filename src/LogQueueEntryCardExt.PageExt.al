pageextension 50244 "cor LogQueueEntryCardExt" extends 673
{
    actions
    {
        addlast(Creation)
        {
            action("cor Subtasks")
            {
                ApplicationArea = all;
                Caption = 'Subtasks Log';
                Image = Action;

                trigger OnAction();
                var
                    LogJobQueue_loc: Record "cor LogJobQueue";
                    JobQueueLogEntriesList_loc: Page "cor Job Queue Log Entries List";
                begin
                    LogJobQueue_loc.SetRange(ID, rec.ID);
                    JobQueueLogEntriesList_loc.Run();
                end;
            }
            action("cor kej func")
            {
                ApplicationArea = all;
                Caption = 'kej func';
                Image = Action;

                trigger OnAction();
                var
                    kejfunc: Codeunit "cor KEJFunc";
                begin
                    kejfunc.Run(Rec);
                end;
            }
        }
    }
}