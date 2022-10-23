// Copyright (c) 2022 XXIV
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

pub const Name = enum(c_int) {
    UNKNOWN = 0,
    ARC,
    ARROW,
    ARROW2,
    ARROW3,
    BALLOON,
    BALLOON2,
    BOUNCE,
    BOUNCINGBALL,
    BOUNCINGBAR,
    BOXBOUNCE,
    BOXBOUNCE2,
    CHRISTMAS,
    CIRCLE,
    CIRCLEHALVES,
    CIRCLEQUARTERS,
    CLOCK,
    DOTS,
    DOTS10,
    DOTS11,
    DOTS12,
    DOTS2,
    DOTS3,
    DOTS4,
    DOTS5,
    DOTS6,
    DOTS7,
    DOTS8,
    DOTS9,
    DQPB,
    EARTH,
    FLIP,
    GRENADE,
    GROWHORIZONTAL,
    GROWVERTICAL,
    HAMBURGER,
    HEARTS,
    LAYER,
    LINE,
    LINE2,
    MONKEY,
    MOON,
    NOISE,
    PIPE,
    POINT,
    PONG,
    RUNNER,
    SHARK,
    SIMPLEDOTS,
    SIMPLEDOTSSCROLLING,
    SMILEY,
    SQUARECORNERS,
    SQUISH,
    STAR,
    STAR2,
    TOGGLE,
    TOGGLE10,
    TOGGLE11,
    TOGGLE12,
    TOGGLE13,
    TOGGLE2,
    TOGGLE3,
    TOGGLE4,
    TOGGLE5,
    TOGGLE6,
    TOGGLE7,
    TOGGLE8,
    TOGGLE9,
    TRIANGLE,
    WEATHER,
};

pub const Spinner = extern struct {
    name: Name,
    interval: c_int,
    frames_length: c_int,
    frames: [*c][*c]u8,
};
const wow_t = extern struct {
    _id: c_int,
    is_terminal: c_int,
};

extern fn wow_init(s: [*c]Spinner, text: [*c]u8) [*c]wow_t;
extern fn wow_persist(self: [*c]wow_t) void;
extern fn wow_persist_with(self: [*c]wow_t, s: [*c]Spinner, text: [*c]u8) void;
extern fn wow_spinner(self: [*c]wow_t, s: [*c]Spinner) void;
extern fn wow_start(self: [*c]wow_t) void;
extern fn wow_stop(self: [*c]wow_t) void;
extern fn wow_text(self: [*c]wow_t, txt: [*c]u8) void;
extern fn spin_get(name: Name) [*c]Spinner;
extern fn wow_clean(self: [*c]wow_t) void;
extern fn spinner_clean(self: [*c]Spinner) void;

pub const Wow = struct {
    wow: ?*wow_t,

    pub fn init(s: ?*Spinner, txt: []const u8) Wow {
        const res = wow_init(s, @ptrToInt(txt.ptr));
        return .{ .wow = res };
    }

    pub fn persist(self: Wow) void {
        wow_persist(self.wow);
    }

    pub fn persistWith(self: Wow, s: ?*Spinner, txt: []const u8) void {
        wow_persist_with(self.wow, s, @ptrToInt(txt.ptr));
    }

    pub fn spinner(self: Wow, s: ?*Spinner) void {
        wow_spinner(self.wow, s);
    }

    pub fn start(self: Wow) void {
        wow_start(self.wow);
    }

    pub fn stop(self: Wow) void {
        wow_stop(self.wow);
    }

    pub fn text(self: Wow, txt: []const u8) void {
        wow_text(self.wow, @ptrToInt(txt.ptr));
    }

    pub fn deinit(self: Wow) void {
        wow_clean(self.wow);
    }
};

pub fn spinnerGet(name: Name) ?*Spinner {
    return spin_get(name);
}

pub fn spinnerClean(s: ?*Spinner) void {
    spinner_clean(s);
}
