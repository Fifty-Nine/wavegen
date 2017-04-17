/* util.h
 * Copyright (C) 2017 Tim Prince
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
#ifndef WAVEGEN_UTIL_H
#define WAVEGEN_UTIL_H

#include <type_traits>

namespace wavegen
{

namespace detail
{

template<class T>
struct byteswap_helper
{
    static_assert(
        std::is_pod<std::remove_reference<T>>(),
        "Can't byteswap a non-POD type."
    );
    byteswap_helper(const T& v) {
        for (size_t i = 0; i < sizeof(T); ++i) {
            data[i] = *(((uint8_t*)&v) + sizeof(T) - i - 1);
        }
    }

    uint8_t data[sizeof(T)];
};

} /* namespace detail */

template<class T>
detail::byteswap_helper<T> byteswap(const T& value)
{
    return detail::byteswap_helper<T> { value };
}

template<class T>
constexpr T mask(T bits)
{
    static_assert(std::is_integral<T>(), "Expected an integral type.");
    return (T(1) << bits) - T(1);
}

} /* namespace wavegen */

#endif /* WAVEGEN_UTIL_H */
