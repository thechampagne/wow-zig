# wow-zig

[![](https://img.shields.io/github/v/tag/thechampagne/wow-zig?label=version)](https://github.com/thechampagne/wow-zig/releases/latest) [![](https://img.shields.io/github/license/thechampagne/wow-zig)](https://github.com/thechampagne/wow-zig/blob/main/LICENSE)

Zig binding for **wow-cgo**.

### API

```zig
const Wow = struct {

    fn init(s: ?*Spinner, txt: []const u8) Wow;

    fn persist(self: Wow) void;

    fn persistWith(self: Wow, s: ?*Spinner, txt: []const u8) void;

    fn spinner(self: Wow, s: ?*Spinner) void;

    fn start(self: Wow) void;

    fn stop(self: Wow) void;

    fn text(self: Wow, txt: []const u8) void;

    fn deinit(self: Wow) void;
};

fn spinnerGet(name: Name) ?*Spinner;

fn spinnerClean(s: ?*Spinner) void;
```

### References
 - [wow-cgo](https://github.com/thechampagne/wow-cgo)

### License

This repo is released under the [MIT](https://github.com/thechampagne/wow-zig/blob/main/LICENSE).
