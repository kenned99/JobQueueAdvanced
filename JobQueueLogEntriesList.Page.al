page 50244 "cor Job Queue Log Entries List"
{

    ApplicationArea = All;
    Caption = 'Job Queue Log Entries List';
    PageType = List;
    SourceTable = "cor LogJobQueue";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field';
                    ApplicationArea = All;
                }
                field("Earliest Start Date/Time"; Rec."Earliest Start Date/Time")
                {
                    ToolTip = 'Specifies the value of the Earliest Start Date/Time field';
                    ApplicationArea = All;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field';
                    ApplicationArea = All;
                }
                field("Error Message"; Rec."Error Message")
                {
                    ToolTip = 'Specifies the value of the Error Message field';
                    ApplicationArea = All;
                }
                field("Expiration Date/Time"; Rec."Expiration Date/Time")
                {
                    ToolTip = 'Specifies the value of the Expiration Date/Time field';
                    ApplicationArea = All;
                }
                field(ID; Rec.ID)
                {
                    ToolTip = 'Specifies the value of the ID field';
                    ApplicationArea = All;
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field';
                    ApplicationArea = All;
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field';
                    ApplicationArea = All;
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field';
                    ApplicationArea = All;
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field';
                    ApplicationArea = All;
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field';
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field';
                    ApplicationArea = All;
                }
            }
        }
    }
}
