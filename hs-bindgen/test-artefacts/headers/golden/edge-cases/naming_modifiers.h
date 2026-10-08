typedef struct {
  int count;
} widget;

typedef enum {
  WIDGET_READY = 0,
  WIDGET_DONE = 1
} widget_state;

typedef void (*widget_callback)(widget *value);
widget widget_create(widget_state state, widget_callback callback);
