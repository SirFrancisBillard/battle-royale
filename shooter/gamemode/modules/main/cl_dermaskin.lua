
local surface = surface
local draw = draw
local Color = Color

surface.CreateFont("MaterialMeepen", {
    font = "Tahoma",
    size = 13,
    weight = 500,
    antialias = true,
    extended = true
})

SKIN = {}
local SKIN = SKIN
local DARK_50, DARK_25, DARK_100, WHITE = Color(0,0,0,45), Color(0,0,0,35), Color(0, 0, 0, 80) Color(255,255,255,255)
local WHITISH = Color(225,225,225,255)

local cv = CreateConVar("materialmeepen_accent", "61 120 148", FCVAR_ARCHIVE, "Sets the accent color for MaterialMeepen skin 'r g b'")
local last_value = ""
local function StringToColor(str)
    local r,g,b = str:match "(%d?%d?%d),? (%d?%d?%d),? (%d?%d?%d)"
    if (not r) then return nil end
    return Color(r,g,b)
end
timer.Create("MaterialMeepenConvar", 0, 0, function()
    if (cv:GetString() ~= last_value) then
        last_value = cv:GetString()
        SKIN.Accent = StringToColor(last_value)
        if (not SKIN.Accent) then
            SKIN.Accent = Color(0, 120, 215)
        end
    end
end)

SKIN.Accent = Color(255,255,255,255)
SKIN.PrintName 		= "Material Meepen"
SKIN.Author 		= "Meepen"
SKIN.DermaVersion	= 1
SKIN.GwenTexture	= Material( "gwenskin/GModDefault.png" )

SKIN.bg_color 					= Color( 101, 100, 105, 255 )
SKIN.bg_color_sleep 			= Color( 70, 70, 70, 255 )
SKIN.bg_color_dark				= Color( 55, 57, 61, 255 )
SKIN.bg_color_bright			= Color( 220, 220, 220, 255 )
SKIN.frame_border				= Color( 50, 50, 50, 255 )


SKIN.fontFrame					= "MaterialMeepen"

SKIN.control_color 				= Color( 120, 120, 120, 255 )
SKIN.control_color_highlight	= Color( 150, 150, 150, 255 )
SKIN.control_color_active 		= Color( 110, 150, 250, 255 )
SKIN.control_color_bright 		= Color( 255, 200, 100, 255 )
SKIN.control_color_dark 		= Color( 100, 100, 100, 255 )

SKIN.bg_alt1 					= Color( 50, 50, 50, 255 )
SKIN.bg_alt2 					= Color( 55, 55, 55, 255 )

SKIN.listview_hover				= Color( 70, 70, 70, 255 )
SKIN.listview_selected			= Color( 100, 170, 220, 255 )

SKIN.text_bright				= Color( 255, 255, 255, 255 )
SKIN.text_normal				= Color( 180, 180, 180, 255 )
SKIN.text_dark					= Color( 20, 20, 20, 255 )
SKIN.text_highlight				= Color( 255, 20, 20, 255 )

SKIN.texGradientUp				= Material( "gui/gradient_up" )
SKIN.texGradientDown			= Material( "gui/gradient_down" )

SKIN.combobox_selected			= SKIN.listview_selected

SKIN.panel_transback			= Color( 255, 255, 255, 50 )
SKIN.tooltip					= Color( 255, 245, 175, 255 )

SKIN.colPropertySheet 			= Color( 170, 170, 170, 255 )
SKIN.colTab			 			= SKIN.colPropertySheet
SKIN.colTabInactive				= Color( 140, 140, 140, 255 )
SKIN.colTabShadow				= Color( 0, 0, 0, 170 )
SKIN.colTabText		 			= Color( 255, 255, 255, 255 )
SKIN.colTabTextInactive			= Color( 0, 0, 0, 200 )
SKIN.fontTab					= "MaterialMeepen"

SKIN.colCollapsibleCategory		= Color( 255, 255, 255, 20 )

SKIN.colCategoryText			= Color( 255, 255, 255, 255 )
SKIN.colCategoryTextInactive	= Color( 200, 200, 200, 255 )
SKIN.fontCategoryHeader			= "MaterialMeepen"

SKIN.colNumberWangBG			= Color( 255, 240, 150, 255 )
SKIN.colTextEntryBG				= Color( 240, 240, 240, 255 )
SKIN.colTextEntryBorder			= Color( 20, 20, 20, 255 )
SKIN.colTextEntryText			= Color( 20, 20, 20, 255 )
SKIN.colTextEntryTextHighlight	= Color( 20, 200, 250, 255 )
SKIN.colTextEntryTextCursor		= Color( 0, 0, 100, 255 )

SKIN.colMenuBG					= Color( 255, 255, 255, 200 )
SKIN.colMenuBorder				= Color( 0, 0, 0, 200 )

SKIN.colButtonText				= Color( 255, 255, 255, 255 )
SKIN.colButtonTextDisabled		= Color( 255, 255, 255, 55 )
SKIN.colButtonBorder			= Color( 20, 20, 20, 255 )
SKIN.colButtonBorderHighlight	= Color( 255, 255, 255, 50 )
SKIN.colButtonBorderShadow		= Color( 0, 0, 0, 100 )



SKIN.tex = {}

SKIN.tex.Selection		 			= GWEN.CreateTextureBorder( 384, 32, 31, 31, 4, 4, 4, 4 )

SKIN.tex.Tree						= GWEN.CreateTextureBorder( 256, 128, 127, 127, 16, 16, 16, 16 )

SKIN.tex.TreePlus					= GWEN.CreateTextureNormal( 448, 96, 15, 15 )
SKIN.tex.TreeMinus					= GWEN.CreateTextureNormal( 464, 96, 15, 15 )
--SKIN.tex.Menu_Strip				= GWEN.CreateTextureBorder( 0, 128, 127, 21, 1, 1, 1, 1 )
SKIN.tex.TextBox					= GWEN.CreateTextureBorder( 0, 150, 127, 21, 4, 4, 4, 4 )
SKIN.tex.TextBox_Focus				= GWEN.CreateTextureBorder( 0, 172, 127, 21, 4, 4, 4, 4 )
SKIN.tex.TextBox_Disabled			= GWEN.CreateTextureBorder( 0, 194, 127, 21, 4, 4, 4, 4 )
SKIN.tex.MenuBG_Column				= GWEN.CreateTextureBorder( 128, 128, 127, 63, 24, 8, 8, 8 )
SKIN.tex.MenuBG						= GWEN.CreateTextureBorder( 128, 192, 127, 63, 8, 8, 8, 8 )
SKIN.tex.MenuBG_Hover				= GWEN.CreateTextureBorder( 128, 256, 127, 31, 8, 8, 8, 8 )
SKIN.tex.MenuBG_Spacer				= GWEN.CreateTextureNormal( 128, 288, 127, 3 )
SKIN.tex.Menu_Strip					= GWEN.CreateTextureBorder( 0, 128, 127, 21, 8, 8, 8, 8)
SKIN.tex.Menu_Check					= GWEN.CreateTextureNormal( 448, 112, 15, 15 )
SKIN.tex.Tab_Control				= GWEN.CreateTextureBorder( 0, 256, 127, 127, 8, 8, 8, 8 )
SKIN.tex.TabB_Active				= GWEN.CreateTextureBorder( 0,		416, 63, 31, 8, 8, 8, 8 )
SKIN.tex.TabB_Inactive				= GWEN.CreateTextureBorder( 0+128,	416, 63, 31, 8, 8, 8, 8 )
SKIN.tex.TabT_Active				= GWEN.CreateTextureBorder( 0,		384, 63, 31, 8, 8, 8, 8 )
SKIN.tex.TabT_Inactive				= GWEN.CreateTextureBorder( 0+128,	384, 63, 31, 8, 8, 8, 8 )
SKIN.tex.TabL_Active				= GWEN.CreateTextureBorder( 64,		384, 31, 63, 8, 8, 8, 8 )
SKIN.tex.TabL_Inactive				= GWEN.CreateTextureBorder( 64+128,	384, 31, 63, 8, 8, 8, 8 )
SKIN.tex.TabR_Active				= GWEN.CreateTextureBorder( 96,		384, 31, 63, 8, 8, 8, 8 )
SKIN.tex.TabR_Inactive				= GWEN.CreateTextureBorder( 96+128,	384, 31, 63, 8, 8, 8, 8 )
SKIN.tex.Tab_Bar					= GWEN.CreateTextureBorder( 128, 352, 127, 31, 4, 4, 4, 4 )

SKIN.tex.Window = {}

SKIN.tex.Window.Normal			= GWEN.CreateTextureBorder( 0, 0, 127, 127, 8, 32, 8, 8 )
SKIN.tex.Window.Inactive		= GWEN.CreateTextureBorder( 128, 0, 127, 127, 8, 32, 8, 8 )

SKIN.tex.Window.Close			= GWEN.CreateTextureNormal( 32, 448, 31, 31 )
SKIN.tex.Window.Close_Hover		= GWEN.CreateTextureNormal( 64, 448, 31, 31 )
SKIN.tex.Window.Close_Down		= GWEN.CreateTextureNormal( 96, 448, 31, 31 )

SKIN.tex.Window.Maxi			= GWEN.CreateTextureNormal( 32 + 96*2, 448, 31, 31 )
SKIN.tex.Window.Maxi_Hover		= GWEN.CreateTextureNormal( 64 + 96*2, 448, 31, 31 )
SKIN.tex.Window.Maxi_Down		= GWEN.CreateTextureNormal( 96 + 96*2, 448, 31, 31 )

SKIN.tex.Window.Restore			= GWEN.CreateTextureNormal( 32 + 96*2, 448+32, 31, 31 )
SKIN.tex.Window.Restore_Hover	= GWEN.CreateTextureNormal( 64 + 96*2, 448+32, 31, 31 )
SKIN.tex.Window.Restore_Down	= GWEN.CreateTextureNormal( 96 + 96*2, 448+32, 31, 31 )

SKIN.tex.Window.Mini			= GWEN.CreateTextureNormal( 32 + 96, 448, 31, 31 )
SKIN.tex.Window.Mini_Hover		= GWEN.CreateTextureNormal( 64 + 96, 448, 31, 31 )
SKIN.tex.Window.Mini_Down		= GWEN.CreateTextureNormal( 96 + 96, 448, 31, 31 )

SKIN.tex.Scroller = {}
SKIN.tex.Scroller.TrackV				= GWEN.CreateTextureBorder( 384,		208, 15, 127, 4, 4, 4, 4 )
SKIN.tex.Scroller.ButtonV_Normal		= GWEN.CreateTextureBorder( 384 + 16,	208, 15, 127, 4, 4, 4, 4 )
SKIN.tex.Scroller.ButtonV_Hover			= GWEN.CreateTextureBorder( 384 + 32,	208, 15, 127, 4, 4, 4, 4 )
SKIN.tex.Scroller.ButtonV_Down			= GWEN.CreateTextureBorder( 384 + 48,	208, 15, 127, 4, 4, 4, 4 )
SKIN.tex.Scroller.ButtonV_Disabled		= GWEN.CreateTextureBorder( 384 + 64,	208, 15, 127, 4, 4, 4, 4 )

SKIN.tex.Scroller.TrackH				= GWEN.CreateTextureBorder( 384, 128,		127, 15, 4, 4, 4, 4 )
SKIN.tex.Scroller.ButtonH_Normal		= GWEN.CreateTextureBorder( 384, 128 + 16,	127, 15, 4, 4, 4, 4 )
SKIN.tex.Scroller.ButtonH_Hover			= GWEN.CreateTextureBorder( 384, 128 + 32,	127, 15, 4, 4, 4, 4 )
SKIN.tex.Scroller.ButtonH_Down			= GWEN.CreateTextureBorder( 384, 128 + 48,	127, 15, 4, 4, 4, 4 )
SKIN.tex.Scroller.ButtonH_Disabled		= GWEN.CreateTextureBorder( 384, 128 + 64,	127, 15, 4, 4, 4, 4 )

SKIN.tex.Scroller.LeftButton_Normal		= GWEN.CreateTextureBorder( 464,		208, 15, 15, 2, 2, 2, 2 )
SKIN.tex.Scroller.LeftButton_Hover		= GWEN.CreateTextureBorder( 480,		208, 15, 15, 2, 2, 2, 2 )
SKIN.tex.Scroller.LeftButton_Down		= GWEN.CreateTextureBorder( 464,		272, 15, 15, 2, 2, 2, 2 )
SKIN.tex.Scroller.LeftButton_Disabled	= GWEN.CreateTextureBorder( 480 + 48,	272, 15, 15, 2, 2, 2, 2 )

SKIN.tex.Scroller.UpButton_Normal		= GWEN.CreateTextureBorder( 464,		208 + 16, 15, 15, 2, 2, 2, 2 )
SKIN.tex.Scroller.UpButton_Hover		= GWEN.CreateTextureBorder( 480,		208 + 16, 15, 15, 2, 2, 2, 2 )
SKIN.tex.Scroller.UpButton_Down			= GWEN.CreateTextureBorder( 464,		272 + 16, 15, 15, 2, 2, 2, 2 )
SKIN.tex.Scroller.UpButton_Disabled		= GWEN.CreateTextureBorder( 480 + 48,	272 + 16, 15, 15, 2, 2, 2, 2 )

SKIN.tex.Scroller.RightButton_Normal	= GWEN.CreateTextureBorder( 464,		208 + 32, 15, 15, 2, 2, 2, 2 )
SKIN.tex.Scroller.RightButton_Hover		= GWEN.CreateTextureBorder( 480,		208 + 32, 15, 15, 2, 2, 2, 2 )
SKIN.tex.Scroller.RightButton_Down		= GWEN.CreateTextureBorder( 464,		272 + 32, 15, 15, 2, 2, 2, 2 )
SKIN.tex.Scroller.RightButton_Disabled	= GWEN.CreateTextureBorder( 480 + 48,	272 + 32, 15, 15, 2, 2, 2, 2 )

SKIN.tex.Scroller.DownButton_Normal		= GWEN.CreateTextureBorder( 464,		208 + 48, 15, 15, 2, 2, 2, 2 )
SKIN.tex.Scroller.DownButton_Hover		= GWEN.CreateTextureBorder( 480,		208 + 48, 15, 15, 2, 2, 2, 2 )
SKIN.tex.Scroller.DownButton_Down		= GWEN.CreateTextureBorder( 464,		272 + 48, 15, 15, 2, 2, 2, 2 )
SKIN.tex.Scroller.DownButton_Disabled	= GWEN.CreateTextureBorder( 480 + 48,	272 + 48, 15, 15, 2, 2, 2, 2 )

SKIN.tex.Menu = {}
SKIN.tex.Menu.RightArrow = GWEN.CreateTextureNormal( 464, 112, 15, 15 )

SKIN.tex.Input = {}

SKIN.tex.Input.ComboBox = {}
SKIN.tex.Input.ComboBox.Normal		= GWEN.CreateTextureBorder( 384, 336,	127, 31, 8, 8, 32, 8 )
SKIN.tex.Input.ComboBox.Hover		= GWEN.CreateTextureBorder( 384, 336+32, 127, 31, 8, 8, 32, 8 )
SKIN.tex.Input.ComboBox.Down		= GWEN.CreateTextureBorder( 384, 336+64, 127, 31, 8, 8, 32, 8 )
SKIN.tex.Input.ComboBox.Disabled	= GWEN.CreateTextureBorder( 384, 336+96, 127, 31, 8, 8, 32, 8 )

SKIN.tex.Input.ComboBox.Button = {}
SKIN.tex.Input.ComboBox.Button.Normal	= GWEN.CreateTextureNormal( 496, 272, 15, 15 )
SKIN.tex.Input.ComboBox.Button.Hover	= GWEN.CreateTextureNormal( 496, 272+16, 15, 15 )
SKIN.tex.Input.ComboBox.Button.Down		= GWEN.CreateTextureNormal( 496, 272+32, 15, 15 )
SKIN.tex.Input.ComboBox.Button.Disabled	= GWEN.CreateTextureNormal( 496, 272+48, 15, 15 )

SKIN.tex.Input.UpDown = {}
SKIN.tex.Input.UpDown.Up = {}
SKIN.tex.Input.UpDown.Up.Normal		= GWEN.CreateTextureCentered( 384,		112, 7, 7 )
SKIN.tex.Input.UpDown.Up.Hover		= GWEN.CreateTextureCentered( 384+8,	112, 7, 7 )
SKIN.tex.Input.UpDown.Up.Down		= GWEN.CreateTextureCentered( 384+16,	112, 7, 7 )
SKIN.tex.Input.UpDown.Up.Disabled	= GWEN.CreateTextureCentered( 384+24,	112, 7, 7 )

SKIN.tex.Input.UpDown.Down = {}
SKIN.tex.Input.UpDown.Down.Normal	= GWEN.CreateTextureCentered( 384,		120, 7, 7 )
SKIN.tex.Input.UpDown.Down.Hover	= GWEN.CreateTextureCentered( 384+8,	120, 7, 7 )
SKIN.tex.Input.UpDown.Down.Down		= GWEN.CreateTextureCentered( 384+16,	120, 7, 7 )
SKIN.tex.Input.UpDown.Down.Disabled	= GWEN.CreateTextureCentered( 384+24,	120, 7, 7 )

SKIN.tex.Input.Slider = {}
SKIN.tex.Input.Slider.H = {}
SKIN.tex.Input.Slider.H.Normal		= GWEN.CreateTextureNormal( 416, 32,	15, 15 )
SKIN.tex.Input.Slider.H.Hover		= GWEN.CreateTextureNormal( 416, 32+16, 15, 15 )
SKIN.tex.Input.Slider.H.Down		= GWEN.CreateTextureNormal( 416, 32+32, 15, 15 )
SKIN.tex.Input.Slider.H.Disabled	= GWEN.CreateTextureNormal( 416, 32+48, 15, 15 )

SKIN.tex.Input.Slider.V = {}
SKIN.tex.Input.Slider.V.Normal		= GWEN.CreateTextureNormal( 416+16,	32,	15, 15 )
SKIN.tex.Input.Slider.V.Hover		= GWEN.CreateTextureNormal( 416+16,	32+16, 15, 15 )
SKIN.tex.Input.Slider.V.Down		= GWEN.CreateTextureNormal( 416+16,	32+32, 15, 15 )
SKIN.tex.Input.Slider.V.Disabled	= GWEN.CreateTextureNormal( 416+16,	32+48, 15, 15 )

SKIN.tex.Input.ListBox = {}
SKIN.tex.Input.ListBox.Background		= GWEN.CreateTextureBorder( 256, 256, 63, 127, 8, 8, 8, 8 )
SKIN.tex.Input.ListBox.Hovered			= GWEN.CreateTextureBorder( 320, 320, 31, 31, 8, 8, 8, 8 )
SKIN.tex.Input.ListBox.EvenLine			= GWEN.CreateTextureBorder( 352, 256, 31, 31, 8, 8, 8, 8 )
SKIN.tex.Input.ListBox.OddLine			= GWEN.CreateTextureBorder( 352, 288, 31, 31, 8, 8, 8, 8 )
SKIN.tex.Input.ListBox.EvenLineSelected	= GWEN.CreateTextureBorder( 320, 270, 31, 31, 8, 8, 8, 8 )
SKIN.tex.Input.ListBox.OddLineSelected	= GWEN.CreateTextureBorder( 320, 288, 31, 31, 8, 8, 8, 8 )

SKIN.tex.ProgressBar = {}
SKIN.tex.ProgressBar.Back	= GWEN.CreateTextureBorder( 384,	0, 31, 31, 8, 8, 8, 8 )
SKIN.tex.ProgressBar.Front	= GWEN.CreateTextureBorder( 384+32, 0, 31, 31, 8, 8, 8, 8 )


SKIN.tex.CategoryList = {}
SKIN.tex.CategoryList.Outer		= GWEN.CreateTextureBorder( 256,		384, 63, 63, 8, 8, 8, 8 )
SKIN.tex.CategoryList.Inner		= GWEN.CreateTextureBorder( 256 + 64,	384, 63, 63, 8, 21, 8, 8 )
SKIN.tex.CategoryList.Header	= GWEN.CreateTextureBorder( 320,		352, 63, 31, 8, 8, 8, 8 )

SKIN.tex.Tooltip = GWEN.CreateTextureBorder( 384, 64, 31, 31, 8, 8, 8, 8 )

SKIN.Colours = {}

SKIN.Colours.Window = {}
SKIN.Colours.Window.TitleActive			= Color(255,255,255,255)
SKIN.Colours.Window.TitleInactive		= SKIN.Colours.Window.TitleActive

SKIN.Colours.Button = {}
SKIN.Colours.Button.Normal				= Color(24,24,24,255)
SKIN.Colours.Button.Hover				=  SKIN.Colours.Button.Normal
SKIN.Colours.Button.Down				= SKIN.Colours.Button.Normal
SKIN.Colours.Button.Disabled			= Color(100,100,100,255)

SKIN.Colours.Tab = {}
SKIN.Colours.Tab.Active = {}
SKIN.Colours.Tab.Active.Normal			= SKIN.Colours.Button.Normal
SKIN.Colours.Tab.Active.Hover			= SKIN.Colours.Button.Normal
SKIN.Colours.Tab.Active.Down			= SKIN.Colours.Button.Normal
SKIN.Colours.Tab.Active.Disabled		= SKIN.Colours.Button.Disabled

SKIN.Colours.Tab.Inactive = {}
SKIN.Colours.Tab.Inactive.Normal		= SKIN.Colours.Button.Normal
SKIN.Colours.Tab.Inactive.Hover			= SKIN.Colours.Button.Normal
SKIN.Colours.Tab.Inactive.Down			= SKIN.Colours.Button.Normal
SKIN.Colours.Tab.Inactive.Disabled		= SKIN.Colours.Button.Disabled

SKIN.Colours.Label = {}
SKIN.Colours.Label.Default				= SKIN.Colours.Button.Normal
SKIN.Colours.Label.Bright				= SKIN.Colours.Button.Normal
SKIN.Colours.Label.Dark					= SKIN.Colours.Button.Normal
SKIN.Colours.Label.Highlight			= SKIN.Colours.Button.Normal

SKIN.Colours.Tree = {}
SKIN.Colours.Tree.Lines					= Color(100,100,100,255) ---- !!!
SKIN.Colours.Tree.Normal				= SKIN.Colours.Button.Normal
SKIN.Colours.Tree.Hover					= Color(50,25,200,255)
SKIN.Colours.Tree.Selected				= Color(50,25,175,255)

SKIN.Colours.Properties = {}
SKIN.Colours.Properties.Line_Normal			= GWEN.TextureColor( 4 + 8 * 12, 508 )
SKIN.Colours.Properties.Line_Selected		= GWEN.TextureColor( 4 + 8 * 13, 508 )
SKIN.Colours.Properties.Line_Hover			= GWEN.TextureColor( 4 + 8 * 12, 500 )
SKIN.Colours.Properties.Title				= GWEN.TextureColor( 4 + 8 * 13, 500 )
SKIN.Colours.Properties.Column_Normal		= GWEN.TextureColor( 4 + 8 * 14, 508 )
SKIN.Colours.Properties.Column_Selected		= GWEN.TextureColor( 4 + 8 * 15, 508 )
SKIN.Colours.Properties.Column_Hover		= GWEN.TextureColor( 4 + 8 * 14, 500 )
SKIN.Colours.Properties.Border				= GWEN.TextureColor( 4 + 8 * 15, 500 )
SKIN.Colours.Properties.Label_Normal		= GWEN.TextureColor( 4 + 8 * 16, 508 )
SKIN.Colours.Properties.Label_Selected		= GWEN.TextureColor( 4 + 8 * 17, 508 )
SKIN.Colours.Properties.Label_Hover			= GWEN.TextureColor( 4 + 8 * 16, 500 )

SKIN.Colours.Category = {}
SKIN.Colours.Category.Header				= SKIN.Colours.Window.TitleActive
SKIN.Colours.Category.Header_Closed			= SKIN.Colours.Window.TitleActive
SKIN.Colours.Category.Line = {}
SKIN.Colours.Category.Line.Text				= SKIN.Colours.Button.Normal
SKIN.Colours.Category.Line.Text_Hover		= SKIN.Colours.Button.Normal
SKIN.Colours.Category.Line.Text_Selected	= SKIN.Colours.Button.Normal
SKIN.Colours.Category.Line.Button			= DARK_25
SKIN.Colours.Category.Line.Button_Hover		= DARK_25
SKIN.Colours.Category.Line.Button_Selected	= DARK_25
SKIN.Colours.Category.LineAlt = {}
SKIN.Colours.Category.LineAlt.Text				= SKIN.Colours.Button.Normal
SKIN.Colours.Category.LineAlt.Text_Hover		= SKIN.Colours.Button.Normal
SKIN.Colours.Category.LineAlt.Text_Selected		= SKIN.Colours.Button.Normal
SKIN.Colours.Category.LineAlt.Button			= DARK_50
SKIN.Colours.Category.LineAlt.Button_Hover		= DARK_50
SKIN.Colours.Category.LineAlt.Button_Selected	= DARK_50

SKIN.Colours.TooltipText = Color(0,0,0,255)


--[[

]]

function SKIN:GetTable(panel)
    panel.__derma__ = panel.__derma__ or {}
    return panel.__derma__
end

function SKIN:GenerateBackdropColor(panel)

    self:GetTable(panel).Verified = true
    local parent = panel:GetParent()
    while (IsValid(parent)) do
        if (self:GetTable(parent).Verified) then
            return WHITISH
        end
        parent = parent:GetParent()
    end

    return WHITISH
end


--[[---------------------------------------------------------
	Panel
-----------------------------------------------------------]]
function SKIN:PaintPanel( panel, w, h )

	if ( !panel.m_bBackground ) then return end
    surface.SetDrawColor(self:GenerateBackdropColor(panel) or WHITE)
    surface.DrawRect(0,0,w,h)
end

--[[---------------------------------------------------------
	Panel
-----------------------------------------------------------]]
function SKIN:PaintShadow( panel, w, h )

end

--[[---------------------------------------------------------
	Frame
-----------------------------------------------------------]]
function SKIN:PaintFrame( panel, w, h )

    surface.SetDrawColor(self:GenerateBackdropColor(panel) or WHITE)
    surface.DrawRect(0,0,w,h)
    surface.SetDrawColor(255,255,255,255)
    surface.DrawRect(0, 0, w, 24)
    surface.SetDrawColor(ColorAlpha(SKIN.Accent, 225))
    surface.DrawRect(0, 0, w, 24)
    surface.SetDrawColor(SKIN.Accent)
    surface.DrawRect(1,1, w - 2, 23)

end

--[[---------------------------------------------------------
	Button
-----------------------------------------------------------]]
function SKIN:PaintButton( panel, w, h )

	if ( !panel.m_bBackground ) then return end

    local tbl = self:GetTable(panel)
    tbl.HoverTime = tbl.HoverTime or 0

	surface.SetDrawColor(self:GenerateBackdropColor(panel) or DARK_100)
    surface.DrawOutlinedRect(0,0,w,h)
    surface.SetDrawColor(WHITISH)
    surface.DrawRect(1, 1, w - 2, h - 2)

	if ( panel.Hovered ) then
        tbl.HoverTime = SysTime()
    end
	if ( panel.Depressed || panel:IsSelected() || panel:GetToggle() ) then
        surface.SetDrawColor(DARK_50)
        surface.DrawOutlinedRect(0,0,w,h)
        surface.SetDrawColor(96,143,210,128)
        surface.DrawRect(1,1,w-2,h-2)
	else
        local fraction = 1 - math.Clamp(
            Lerp((SysTime() - tbl.HoverTime) * 5, 0, 1),
            0,
            1
        )

        surface.SetDrawColor(96,143,210,255*fraction)
        surface.DrawOutlinedRect(0,0,w,h)
        surface.SetDrawColor(96,143,210,64*fraction)
        surface.DrawRect(1,1,w-2,h-2)

    end


end


--[[---------------------------------------------------------
	Tree
-----------------------------------------------------------]]
function SKIN:PaintTree( panel, w, h )

	if ( !panel.m_bBackground ) then return end

	surface.SetDrawColor(DARK_50)
    surface.DrawRect(0, 0, w, h)
    surface.SetDrawColor(DARK_25)
    surface.DrawOutlinedRect(0, 0, w, h)

end


--[[---------------------------------------------------------
	CheckBox
-----------------------------------------------------------]]
function SKIN:PaintCheckBox( panel, w, h )

    surface.SetDrawColor(20,20,20,255)
    surface.DrawOutlinedRect(0, 0, w, h)
	surface.SetDrawColor(WHITISH)
    surface.DrawRect(1,1,w-2,h-2)
    if (panel:GetChecked()) then
        surface.SetDrawColor(SKIN.Accent)
        surface.DrawRect(2,2,w-4,h-4)
    end

end

--[[---------------------------------------------------------
	ExpandButton
-----------------------------------------------------------]]
function SKIN:PaintExpandButton( panel, w, h )

	if ( !panel:GetExpanded() ) then
		self.tex.TreePlus( 0, 0, w, h )
	else
		self.tex.TreeMinus( 0, 0, w, h )
	end

end

--[[---------------------------------------------------------
	TextEntry
-----------------------------------------------------------]]
function SKIN:PaintTextEntry( panel, w, h )

	if ( panel.m_bBackground ) then

		if ( panel:GetDisabled() ) then
			self.tex.TextBox_Disabled( 0, 0, w, h )
		else
			self.tex.TextBox( 0, 0, w, h )
		end

	end


	panel:DrawTextEntryText( panel:GetTextColor(), panel:GetHighlightColor(), panel:GetCursorColor() )

end

--[[---------------------------------------------------------
	Menu
-----------------------------------------------------------]]
function SKIN:PaintMenu( panel, w, h )

	if ( panel:GetDrawColumn() ) then
		self.tex.MenuBG_Column( 0, 0, w, h )
	else
		self.tex.MenuBG( 0, 0, w, h )
	end

end

--[[---------------------------------------------------------
	Menu
-----------------------------------------------------------]]
function SKIN:PaintMenuSpacer( panel, w, h )

	self.tex.MenuBG( 0, 0, w, h )

end

--[[---------------------------------------------------------
	MenuOption
-----------------------------------------------------------]]
function SKIN:PaintMenuOption( panel, w, h )

	if ( panel.m_bBackground && (panel.Hovered || panel.Highlight) ) then
		self.tex.MenuBG_Hover( 0, 0, w, h )
	end

	if ( panel:GetChecked() ) then
		self.tex.Menu_Check( 5, h/2-7, 15, 15 )
	end

end

--[[---------------------------------------------------------
	MenuRightArrow
-----------------------------------------------------------]]
function SKIN:PaintMenuRightArrow( panel, w, h )

	self.tex.Menu.RightArrow( 0, 0, w, h )

end

--[[---------------------------------------------------------
	PropertySheet
-----------------------------------------------------------]]
function SKIN:PaintPropertySheet( panel, w, h )

    surface.SetDrawColor(self:GenerateBackdropColor(panel) or DARK_50)
    surface.DrawRect(0,0,w,h)

	local ActiveTab = panel:GetActiveTab()
	local Offset = 0
	if ( ActiveTab ) then Offset = ActiveTab:GetTall()-8 end

    surface.DrawRect(0,Offset,w,h-Offset)
    surface.SetDrawColor(DARK_100)
    surface.DrawLine(0, Offset, 0, h)
    surface.DrawLine(w - 1,Offset,w - 1, h)
    surface.DrawLine(0, h - 1, w - 1, h - 1)

    local tx, ty = ActiveTab:CursorPos()
    tx = panel:CursorPos() - tx
    local tw = ActiveTab:GetWide()

    surface.DrawLine(1, Offset, tx + 1, Offset)
    surface.DrawLine(tx + tw - 1, Offset, w - 1, Offset)

end

--[[---------------------------------------------------------
	Tab
-----------------------------------------------------------]]
function SKIN:PaintTab( panel, w, h )

	if ( panel:GetPropertySheet():GetActiveTab() == panel ) then
		return self:PaintActiveTab( panel, w, h )
	end


end

function SKIN:PaintActiveTab( panel, w, h )

    h = h - 8

    surface.SetDrawColor(DARK_25)
    surface.DrawRect(0,0,w,h)

    surface.SetDrawColor(DARK_50)
    surface.DrawLine(0, 0, w - 1, 0)
    surface.DrawLine(0, 0, 0, h)
    surface.DrawLine(w - 1, 0, w - 1, h)

end

--[[---------------------------------------------------------
	Button
-----------------------------------------------------------]]
function SKIN:PaintWindowCloseButton( panel, w, h )
    h = 22
    local min = math.min(w,h)
    local tbl = self:GetTable(panel)
    tbl.HoverTime = tbl.HoverTime or 0

	if ( !panel.m_bBackground ) then return end

	if ( panel:GetDisabled() ) then
		return
	end

	if ( panel.Hovered ) then
        tbl.HoverTime = SysTime()
	end

	if ( panel.Depressed || panel:IsSelected() ) then
		surface.SetDrawColor(155,52,102,255)
        surface.DrawRect(0,1,w,h)
	else
        local fraction = 1 - math.Clamp(
            Lerp((SysTime() - tbl.HoverTime) * 2, 0, 1),
            0,
            1
        )
        surface.SetDrawColor(232,17,35,255*fraction)
        surface.DrawRect(0, 1, w, h)

    end
    local space = math.ceil(min / 6)
    local w2, h2 = math.floor(w / 2), math.floor(h / 2)
    surface.SetDrawColor(240,240,240,255)
    surface.DrawLine(w2 + space, h2 + space, w2 - space, h2 - space)
    surface.DrawLine(w2 + space, h2 - space, w2 - space, h2 + space)

end

-- BIG TODO: MAKE THIS NOT AN X, I AM TOO LAZY TO DO IT BECAUSE MOST PEOPLE WILL JUST REMOVE OR DISABLE OR NOT USE THIS AT ALL

function SKIN:PaintWindowMinimizeButton( panel, w, h )
    h = 22
    local min = math.min(w,h)
    local tbl = self:GetTable(panel)
    tbl.HoverTime = tbl.HoverTime or 0

	if ( !panel.m_bBackground ) then return end

	if ( panel:GetDisabled() ) then
		return
	end

	if ( panel.Hovered ) then
        tbl.HoverTime = SysTime()
	end

	if ( panel.Depressed || panel:IsSelected() ) then
		surface.SetDrawColor(155,52,102,255)
        surface.DrawRect(0,1,w,h)
	else
        local fraction = 1 - math.Clamp(
            Lerp((SysTime() - tbl.HoverTime) * 2, 0, 1),
            0,
            1
        )
        surface.SetDrawColor(232,17,35,255*fraction)
        surface.DrawRect(0, 1, w, h)

    end
    local space = math.ceil(min / 6)
    local w2, h2 = math.floor(w / 2), math.floor(h / 2)
    surface.SetDrawColor(240,240,240,255)
    surface.DrawLine(w2 + space, h2 + space, w2 - space, h2 - space)
    surface.DrawLine(w2 + space, h2 - space, w2 - space, h2 + space)

end
-- BIG TODO: MAKE THIS NOT AN X, I AM TOO LAZY TO DO IT BECAUSE MOST PEOPLE WILL JUST REMOVE OR DISABLE OR NOT USE THIS AT ALL

function SKIN:PaintWindowMaximizeButton( panel, w, h )

    h = 22
    local min = math.min(w,h)
    local tbl = self:GetTable(panel)
    tbl.HoverTime = tbl.HoverTime or 0

	if ( !panel.m_bBackground ) then return end

	if ( panel:GetDisabled() ) then
		return
	end

	if ( panel.Hovered ) then
        tbl.HoverTime = SysTime()
	end

	if ( panel.Depressed || panel:IsSelected() ) then
		surface.SetDrawColor(155,52,102,255)
        surface.DrawRect(0,1,w,h)
	else
        local fraction = 1 - math.Clamp(
            Lerp((SysTime() - tbl.HoverTime) * 2, 0, 1),
            0,
            1
        )
        surface.SetDrawColor(232,17,35,255*fraction)
        surface.DrawRect(0, 1, w, h)

    end
    local space = math.ceil(min / 6)
    local w2, h2 = math.floor(w / 2), math.floor(h / 2)
    surface.SetDrawColor(240,240,240,255)
    surface.DrawLine(w2 + space, h2 + space, w2 - space, h2 - space)
    surface.DrawLine(w2 + space, h2 - space, w2 - space, h2 + space)

end

--[[---------------------------------------------------------
	VScrollBar
-----------------------------------------------------------]]
function SKIN:PaintVScrollBar( panel, w, h )
    surface.SetDrawColor(DARK_25)
    surface.DrawRect(0, 0, w, h)

--	self.tex.Scroller.TrackV( 0, 0, w, h )

end

--[[---------------------------------------------------------
	ScrollBarGrip
-----------------------------------------------------------]]
function SKIN:PaintScrollBarGrip( panel, w, h )

    surface.SetDrawColor(DARK_100)
    surface.DrawRect(0, 0, w, h)
--[[
	if ( panel:GetDisabled() ) then
		return self.tex.Scroller.ButtonV_Disabled( 0, 0, w, h )
	end

	if ( panel.Depressed ) then
		return self.tex.Scroller.ButtonV_Down( 0, 0, w, h )
	end

	if ( panel.Hovered ) then
		return self.tex.Scroller.ButtonV_Hover( 0, 0, w, h )
	end

	return self.tex.Scroller.ButtonV_Normal( 0, 0, w, h )
]]
end

--[[---------------------------------------------------------
	ButtonDown
-----------------------------------------------------------]]
function SKIN:PaintButtonDown( panel, w, h )

    if (panel:GetParent().Derma.ClassName == "DVScrollBar") then

        surface.SetDrawColor(DARK_25)
        surface.DrawRect(0,0,w,h)

        return
    end

	if ( !panel.m_bBackground ) then return end

	if ( panel.Depressed || panel:IsSelected() ) then
		return self.tex.Scroller.DownButton_Down( 0, 0, w, h )
	end

	if ( panel:GetDisabled() ) then
		return self.tex.Scroller.DownButton_Dead( 0, 0, w, h )
	end

	if ( panel.Hovered ) then
		return self.tex.Scroller.DownButton_Hover( 0, 0, w, h )
	end

	self.tex.Scroller.DownButton_Normal( 0, 0, w, h )

end

--[[---------------------------------------------------------
	ButtonUp
-----------------------------------------------------------]]
function SKIN:PaintButtonUp( panel, w, h )

    if (panel:GetParent().Derma.ClassName == "DVScrollBar") then

        surface.SetDrawColor(DARK_25)
        surface.DrawRect(0,0,w,h)

        return
    end

	if ( !panel.m_bBackground ) then return end

	if ( panel.Depressed || panel:IsSelected() ) then
		return self.tex.Scroller.UpButton_Down( 0, 0, w, h )
	end

	if ( panel:GetDisabled() ) then
		return self.tex.Scroller.UpButton_Dead( 0, 0, w, h )
	end

	if ( panel.Hovered ) then
		return self.tex.Scroller.UpButton_Hover( 0, 0, w, h )
	end

	self.tex.Scroller.UpButton_Normal( 0, 0, w, h )

end

--[[---------------------------------------------------------
	ButtonLeft
-----------------------------------------------------------]]
function SKIN:PaintButtonLeft( panel, w, h )

	if ( !panel.m_bBackground ) then return end

	if ( panel.Depressed || panel:IsSelected() ) then
		return self.tex.Scroller.LeftButton_Down( 0, 0, w, h )
	end

	if ( panel:GetDisabled() ) then
		return self.tex.Scroller.LeftButton_Dead( 0, 0, w, h )
	end

	if ( panel.Hovered ) then
		return self.tex.Scroller.LeftButton_Hover( 0, 0, w, h )
	end

	self.tex.Scroller.LeftButton_Normal( 0, 0, w, h )

end

--[[---------------------------------------------------------
	ButtonRight
-----------------------------------------------------------]]
function SKIN:PaintButtonRight( panel, w, h )

	if ( !panel.m_bBackground ) then return end

	if ( panel.Depressed || panel:IsSelected() ) then
		return self.tex.Scroller.RightButton_Down( 0, 0, w, h )
	end

	if ( panel:GetDisabled() ) then
		return self.tex.Scroller.RightButton_Dead( 0, 0, w, h )
	end

	if ( panel.Hovered ) then
		return self.tex.Scroller.RightButton_Hover( 0, 0, w, h )
	end

	self.tex.Scroller.RightButton_Normal( 0, 0, w, h )

end


--[[---------------------------------------------------------
	ComboDownArrow
-----------------------------------------------------------]]
function SKIN:PaintComboDownArrow( panel, w, h )

	if ( panel.ComboBox:GetDisabled() ) then
		return self.tex.Input.ComboBox.Button.Disabled( 0, 0, w, h )
	end

	if ( panel.ComboBox.Depressed || panel.ComboBox:IsMenuOpen() ) then
		return self.tex.Input.ComboBox.Button.Down( 0, 0, w, h )
	end

	if ( panel.ComboBox.Hovered ) then
		return self.tex.Input.ComboBox.Button.Hover( 0, 0, w, h )
	end

	self.tex.Input.ComboBox.Button.Normal( 0, 0, w, h )

end

--[[---------------------------------------------------------
	ComboBox
-----------------------------------------------------------]]
function SKIN:PaintComboBox( panel, w, h )

    self:PaintButton(panel, w, h)

end

--[[---------------------------------------------------------
	ComboBox
-----------------------------------------------------------]]
function SKIN:PaintListBox( panel, w, h )

	self.tex.Input.ListBox.Background( 0, 0, w, h )

end

--[[---------------------------------------------------------
	NumberUp
-----------------------------------------------------------]]
function SKIN:PaintNumberUp( panel, w, h )

	if ( panel:GetDisabled() ) then
		return self.tex.Input.UpDown.Up.Disabled( 0, 0, w, h )
	end

	if ( panel.Depressed ) then
		return self.tex.Input.UpDown.Up.Down( 0, 0, w, h )
	end

	if ( panel.Hovered ) then
		return self.tex.Input.UpDown.Up.Hover( 0, 0, w, h )
	end

	self.tex.Input.UpDown.Up.Normal( 0, 0, w, h )

end

--[[---------------------------------------------------------
	NumberDown
-----------------------------------------------------------]]
function SKIN:PaintNumberDown( panel, w, h )

	if ( panel:GetDisabled() ) then
		return self.tex.Input.UpDown.Down.Disabled( 0, 0, w, h )
	end

	if ( panel.Depressed ) then
		return self.tex.Input.UpDown.Down.Down( 0, 0, w, h )
	end

	if ( panel.Hovered ) then
		return self.tex.Input.UpDown.Down.Hover( 0, 0, w, h )
	end

	self.tex.Input.UpDown.Down.Normal( 0, 0, w, h )

end

function SKIN:PaintTreeNode( panel, w, h )

	if ( !panel.m_bDrawLines ) then return end

	surface.SetDrawColor( self.Colours.Tree.Lines )

	if ( panel.m_bLastChild ) then

		surface.DrawRect( 9, 0, 1, 7 )
		surface.DrawRect( 9, 7, 9, 1 )

	else
		surface.DrawRect( 9, 0, 1, h )
		surface.DrawRect( 9, 7, 9, 1 )
	end

end


function SKIN:PaintTreeNodeButton( panel, w, h )

    w = w + 6

	if ( !panel.m_bSelected ) then return end

	-- Don't worry this isn't working out the size every render
	-- it just gets the cached value from inside the Label
	local w, _ = panel:GetTextSize()

	surface.SetDrawColor(DARK_25)
    surface.DrawRect(38,0,w + 6,h)
    surface.DrawOutlinedRect(38, 0, w + 6, h)

end

function SKIN:PaintSelection( panel, w, h )

	self.tex.Selection( 0, 0, w, h )

end

function SKIN:PaintSliderKnob( panel, w, h )

    surface.SetDrawColor(SKIN.Accent)
    surface.DrawRect(w / 2 - w / 8, 0, w / 4, h)

end

local function PaintNotches( x, y, w, h, num )
--[[
	if ( !num ) then return end

	local space = w / num

	for i=0, num do

		surface.DrawRect( x + i * space, y + 4, 1,  5 )

	end]]

end

function SKIN:PaintNumSlider( panel, w, h )

	surface.SetDrawColor( Color( 0, 0, 0, 100 ) )
	surface.DrawRect( 8, h / 2 - 2, w - 15, 3 )

	PaintNotches( 8, h / 2 - 1, w - 16, 1, panel.m_iNotches )

end

function SKIN:PaintProgress( panel, w, h )

	self.tex.ProgressBar.Back( 0, 0, w, h )
	self.tex.ProgressBar.Front( 0, 0, w * panel:GetFraction(), h )

end

function SKIN:PaintCollapsibleCategoryHeader( w, h )
    surface.SetDrawColor(SKIN.Accent)
    surface.DrawRect(0,0,w,h)
end

function SKIN:PaintCollapsibleCategory( panel, w, h )

    surface.SetDrawColor(DARK_25)
    surface.DrawRect(0,0,w,h)
    panel.Header.Paint = self.PaintCollapsibleCategoryHeader
	if ( panel:GetExpanded() || h >= 40 ) then
    	self.tex.CategoryList.Inner( 0, 0, w, h )
	end

end

function SKIN:PaintCategoryList( panel, w, h )

--	self.tex.CategoryList.Outer( 0, 0, w, h )
    surface.SetDrawColor(0,0,0,15)
    surface.DrawRect(2,2,w-4,h-4)

end

function SKIN:PaintCategoryButton( panel, w, h )

	if ( panel.AltLine ) then

		if ( panel.Depressed || panel.m_bSelected ) then surface.SetDrawColor( self.Colours.Category.LineAlt.Button_Selected )
		elseif ( panel.Hovered ) then surface.SetDrawColor( self.Colours.Category.LineAlt.Button_Hover )
		else surface.SetDrawColor( self.Colours.Category.LineAlt.Button ) end

	else

		if ( panel.Depressed || panel.m_bSelected ) then surface.SetDrawColor( self.Colours.Category.Line.Button_Selected )
		elseif ( panel.Hovered ) then surface.SetDrawColor( self.Colours.Category.Line.Button_Hover )
		else surface.SetDrawColor( self.Colours.Category.Line.Button ) end

	end

	surface.DrawRect( 0, 0, w, h )

end

function SKIN:PaintListViewLine( panel, w, h )

	if ( panel:IsSelected() ) then

		self.tex.Input.ListBox.EvenLineSelected( 0, 0, w, h )

	elseif ( panel.Hovered ) then

		self.tex.Input.ListBox.Hovered( 0, 0, w, h )

	elseif ( panel.m_bAlt ) then

		self.tex.Input.ListBox.EvenLine( 0, 0, w, h )

	end

end

function SKIN:PaintListView( panel, w, h )

	self.tex.Input.ListBox.Background( 0, 0, w, h )

end

function SKIN:PaintTooltip( panel, w, h )

    surface.SetDrawColor(255,255,255,255)
    surface.DrawRect(0, 0, w, h)
    surface.SetDrawColor(0,0,0,255)
    surface.DrawOutlinedRect(0, 0, w, h)

end

function SKIN:PaintMenuBar( panel, w, h )

	surface.SetDrawColor(self:GenerateBackdropColor(panel) or DARK_25)
    surface.DrawRect(0, 0, w, h)

end


derma.DefineSkin( "MaterialMeepen", "Made to look like something else", SKIN )

derma.RefreshSkins()
