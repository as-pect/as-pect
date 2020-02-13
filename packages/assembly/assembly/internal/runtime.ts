
// @ts-ignore: decorator
@inline const BUFFERED_MASK: u32 = 1 << ((sizeof<u32>() * 8) - 1);
// @ts-ignore: decorator
@inline const COLOR_BITS = 3;
// @ts-ignore: decorator
@inline const COLOR_SHIFT: u32 = ctz(BUFFERED_MASK) - COLOR_BITS;
// @ts-ignore: decorator
@inline export const REFCOUNT_MASK: u32 = (1 << COLOR_SHIFT) - 1;