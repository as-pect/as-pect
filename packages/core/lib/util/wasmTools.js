(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    /**
     * A Buffer for reading wasm sections.
     */
    var WasmBuffer = /** @class */ (function () {
        function WasmBuffer(u8array) {
            this.u8array = u8array;
            /** Current offset in the buffer. */
            this.off = 0;
        }
        /** Read 128LEB unsigned integers. */
        WasmBuffer.prototype.readVaruint = function (off) {
            if (off === void 0) { off = this.off; }
            var val = 0;
            var shl = 0;
            var byt;
            var pos = off;
            do {
                byt = this.u8array[pos++];
                val |= (byt & 0x7F) << shl;
                if (!(byt & 0x80))
                    break;
                shl += 7;
            } while (true);
            this.off = pos;
            return val;
        };
        /**
         * Read a UTF8 string from the buffer either at the current offset or one passed in.
         * Updates the offset of the buffer.
         */
        WasmBuffer.prototype.readString = function (off) {
            if (off === void 0) { off = this.off; }
            var name_len = this.readVaruint(off);
            this.off += name_len;
            //@ts-ignore
            return String.fromCharCodes(this.u8array.slice(this.off - name_len, this.off));
        };
        /** Read a string at an offset without changing the buffere's offset. */
        WasmBuffer.prototype.peekString = function (off) {
            var old_off = this.off;
            var str = this.readString(off);
            this.off = old_off;
            return str;
        };
        return WasmBuffer;
    }());
    exports.WasmBuffer = WasmBuffer;
    /**
     * Utility class for reading the name sections of a wasm binary.
     * See https://github.com/WebAssembly/design/blob/master/BinaryEncoding.md#name-section
     */
    var NameSection = /** @class */ (function () {
        function NameSection(contents) {
            /** map of indexs to UTF8 pointers. */
            this.funcNames = new Map();
            var mod = new WebAssembly.Module(contents);
            var section = WebAssembly.Module.customSections(mod, "name")[0];
            this.section = new WasmBuffer(new Uint8Array(section));
            this.parseSection();
        }
        NameSection.prototype.fromIndex = function (i) {
            var ptr = this.funcNames.get(i);
            if (!ptr)
                return "Function " + i;
            return this.section.peekString(ptr);
        };
        /** Parses */
        NameSection.prototype.parseSection = function () {
            var off = this.off;
            var kind = this.readVaruint();
            if (kind != 1) {
                this.off = off;
                return;
            }
            var end = this.readVaruint() + this.off;
            var count = this.readVaruint();
            var numRead = 0;
            while (numRead < count && this.off < end) {
                var index = this.readVaruint();
                this.funcNames.set(index, this.off);
                var len = this.readVaruint();
                this.off += len;
                numRead++;
            }
        };
        Object.defineProperty(NameSection.prototype, "off", {
            /** Current offset */
            get: function () {
                return this.section.off;
            },
            /** Update offset */
            set: function (o) {
                this.section.off = o;
            },
            enumerable: true,
            configurable: true
        });
        /** Reads a 128LEB  unsigned integer and updates the offset. */
        NameSection.prototype.readVaruint = function (off) {
            if (off === void 0) { off = this.off; }
            return this.section.readVaruint(off);
        };
        return NameSection;
    }());
    exports.NameSection = NameSection;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoid2FzbVRvb2xzLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3V0aWwvd2FzbVRvb2xzLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7O0lBQUE7O09BRUc7SUFDSDtRQUlFLG9CQUFtQixPQUFtQjtZQUFuQixZQUFPLEdBQVAsT0FBTyxDQUFZO1lBSHRDLG9DQUFvQztZQUNwQyxRQUFHLEdBQVcsQ0FBQyxDQUFDO1FBRXdCLENBQUM7UUFFekMscUNBQXFDO1FBQ3JDLGdDQUFXLEdBQVgsVUFBWSxHQUFzQjtZQUF0QixvQkFBQSxFQUFBLE1BQWMsSUFBSSxDQUFDLEdBQUc7WUFDaEMsSUFBSSxHQUFHLEdBQUcsQ0FBQyxDQUFDO1lBQ1osSUFBSSxHQUFHLEdBQUcsQ0FBQyxDQUFDO1lBQ1osSUFBSSxHQUFHLENBQUM7WUFDUixJQUFJLEdBQUcsR0FBRyxHQUFHLENBQUM7WUFDZCxHQUFHO2dCQUNELEdBQUcsR0FBRyxJQUFJLENBQUMsT0FBTyxDQUFDLEdBQUcsRUFBRSxDQUFDLENBQUM7Z0JBQzFCLEdBQUcsSUFBSSxDQUFDLEdBQUcsR0FBRyxJQUFJLENBQUMsSUFBSSxHQUFHLENBQUM7Z0JBQzNCLElBQUksQ0FBQyxDQUFDLEdBQUcsR0FBRyxJQUFJLENBQUM7b0JBQUUsTUFBTTtnQkFDekIsR0FBRyxJQUFJLENBQUMsQ0FBQzthQUNWLFFBQVEsSUFBSSxFQUFFO1lBQ2YsSUFBSSxDQUFDLEdBQUcsR0FBRyxHQUFHLENBQUE7WUFDZCxPQUFPLEdBQUcsQ0FBQztRQUNiLENBQUM7UUFFRDs7O1dBR0c7UUFDSCwrQkFBVSxHQUFWLFVBQVcsR0FBc0I7WUFBdEIsb0JBQUEsRUFBQSxNQUFjLElBQUksQ0FBQyxHQUFHO1lBQy9CLElBQU0sUUFBUSxHQUFHLElBQUksQ0FBQyxXQUFXLENBQUMsR0FBRyxDQUFDLENBQUM7WUFDdkMsSUFBSSxDQUFDLEdBQUcsSUFBSSxRQUFRLENBQUM7WUFDckIsWUFBWTtZQUNaLE9B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