#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

int32_t scrap_dummy_bind_symbol(void);

int32_t load_page(int64_t port, const char *url);

#ifdef __cplusplus
} // extern "C"
#endif // __cplusplus
