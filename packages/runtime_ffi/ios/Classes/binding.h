#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

int32_t runtime_setup(void);

int32_t last_error_length(void);

int32_t error_message_utf8(char *buf, int32_t length);

#ifdef __cplusplus
} // extern "C"
#endif // __cplusplus
