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

                trigger OnAction();
                var
                    JobQueueLogEntriesList_loc: Page "cor Job Queue Log Entries List";
                    LogJobQueue_loc: Record "cor LogJobQueue";
                begin
                    LogJobQueue_loc.SetRange(ID, rec.ID);
                    JobQueueLogEntriesList_loc.Run();
                end;
            }
        }
    }
}