#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

#define C_NORM 0x524b4bff
#define C_SEL  0x77ad95ff
#define C_URG  0x855e5cff

#define C_FG   0xfdfbf9ff /* matte white */
#define C_BG   0x282828ff /* matte black */

/* appearance */
static const int sloppyfocus               = 1;
static const int bypass_surface_visibility = 0;
static const unsigned int borderpx         = 1;
static const float rootcolor[]             = COLOR(0x222222ff);
static const float bordercolor[]           = COLOR(C_NORM);
static const float focuscolor[]            = COLOR(C_SEL);
static const float urgentcolor[]           = COLOR(C_URG);
static const float fullscreen_bg[]         = {0.0f, 0.0f, 0.0f, 1.0f};

/* patch: bar */
static uint32_t colors[][3] = {
    [SchemeNorm] = { C_FG, C_BG, C_NORM },
    [SchemeSel]  = { C_FG, C_BG, C_SEL  },
    [SchemeUrg]  = { C_FG, C_BG, C_URG  },
};
static const char *tags[] = { "1", "2", "3", "4" };
static const int topbar = 1;
static const int showbar = 1;

static const char *fonts[] = { "sans-serif" };

#define TAGCOUNT (4)

/* logging */
static int log_level = WLR_ERROR;

static const Rule rules[] = {
    /* app_id             title       tags mask     isfloating   monitor */
    { "Gimp_EXAMPLE",     NULL,       0,            1,           -1 },
    { "firefox_EXAMPLE",  NULL,       1 << 8,       0,           -1 },
};

/* layouts */
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },
	{ "><>",      NULL },
	{ "[M]",      monocle },
};

/* monitors */
static const MonitorRule monrules[] = {
    /* name mfact  nmaster scale layout       rotate/reflect               x   y */
    { NULL, 0.55f, 1,      1.25, &layouts[0], WL_OUTPUT_TRANSFORM_NORMAL, -1, -1 },
};

/* keyboard */
static const struct xkb_rule_names xkb_rules = {};
static const int repeat_rate = 25;
static const int repeat_delay = 600;

/* Trackpad */
static const int tap_to_click = 1;
static const int tap_and_drag = 1;
static const int drag_lock = 1;
static const int natural_scrolling = 0;
static const int disable_while_typing = 1;
static const int left_handed = 0;
static const int middle_button_emulation = 0;
static const enum libinput_config_scroll_method scroll_method = LIBINPUT_CONFIG_SCROLL_2FG;

static const enum libinput_config_click_method click_method = LIBINPUT_CONFIG_CLICK_METHOD_BUTTON_AREAS;

static const uint32_t send_events_mode = LIBINPUT_CONFIG_SEND_EVENTS_ENABLED;

static const enum libinput_config_accel_profile accel_profile = LIBINPUT_CONFIG_ACCEL_PROFILE_ADAPTIVE;
static const double accel_speed = 0.0;

static const enum libinput_config_tap_button_map button_map = LIBINPUT_CONFIG_TAP_MAP_LRM;

#define MODKEY WLR_MODIFIER_ALT
#define SFTMOD MODKEY|WLR_MODIFIER_SHIFT

static const char *menucmd[] = { "wofi", "--show", "drun,run", NULL };

static const Key keys[] = {
	// process
	{ MODKEY, XKB_KEY_p, spawn, {.v = menucmd} },	
	{ SFTMOD, XKB_KEY_c, killclient, {0} },
	{ SFTMOD, XKB_KEY_q, quit, {0} },
	
	// layout
	{ MODKEY, XKB_KEY_t,     setlayout,        {.v = &layouts[0]} },
	{ MODKEY, XKB_KEY_m,     setlayout,        {.v = &layouts[2]} },
	{ MODKEY, XKB_KEY_f,     togglefullscreen, {0} },
	{ MODKEY, XKB_KEY_space, togglefloating,   {0} },

	// ratio
	{ SFTMOD, XKB_KEY_Left,  setmfact, {.f = -0.05f} },
	{ SFTMOD, XKB_KEY_Right, setmfact, {.f = +0.05f} },

	// focus on
	{ MODKEY, XKB_KEY_Left,   focusstack, {.i = -1} },
	{ MODKEY, XKB_KEY_Right,  focusstack, {.i = +1} },
	{ SFTMOD, XKB_KEY_Return, zoom,       {0} },

	// monitor
	{ MODKEY, XKB_KEY_Up,   focusmon, {.i = WLR_DIRECTION_LEFT} },
	{ MODKEY, XKB_KEY_Down, focusmon, {.i = WLR_DIRECTION_RIGHT} },
	{ SFTMOD, XKB_KEY_Up,   tagmon,   {.i = WLR_DIRECTION_LEFT} },
	{ SFTMOD, XKB_KEY_Down, tagmon,   {.i = WLR_DIRECTION_RIGHT} },
	
	// view tag
	{ MODKEY, XKB_KEY_Tab, view, {0} },
	{ MODKEY, XKB_KEY_1, view, { .ui = 1 << 0 } },
	{ MODKEY, XKB_KEY_2, view, { .ui = 1 << 1 } },
	{ MODKEY, XKB_KEY_3, view, { .ui = 1 << 2 } },
	{ MODKEY, XKB_KEY_4, view, { .ui = 1 << 3 } },
	
	// move to tag
	{ SFTMOD, XKB_KEY_1, tag, { .ui = 1 << 0 } },
	{ SFTMOD, XKB_KEY_2, tag, { .ui = 1 << 1 } },
	{ SFTMOD, XKB_KEY_3, tag, { .ui = 1 << 2 } },
	{ SFTMOD, XKB_KEY_4, tag, { .ui = 1 << 3 } },	

	// change vtty
#define CHVT(n) { WLR_MODIFIER_CTRL|WLR_MODIFIER_ALT,XKB_KEY_XF86Switch_VT_##n, chvt, {.ui = (n)} }
	CHVT(1), CHVT(2), CHVT(3), CHVT(4), CHVT(5), CHVT(6),
	CHVT(7), CHVT(8), CHVT(9), CHVT(10), CHVT(11), CHVT(12),
};

static const Button buttons[] = {
	/* target    mods    button     function    arg  */
	// { ClkClient, MODKEY, BTN_LEFT,  moveresize, {.ui = CurMove} },
	{ ClkClient, MODKEY, BTN_RIGHT, moveresize, {.ui = CurResize} },
};

