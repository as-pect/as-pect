(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "assemblyscript"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var assemblyscript_1 = require("assemblyscript");
    function createMember(classDeclaration) {
        var range = classDeclaration.name.range;
        // __aspectStrictEquals(ref: T, stackA: usize[], stackB: usize[]): bool
        return assemblyscript_1.TypeNode.createMethodDeclaration(assemblyscript_1.TypeNode.createIdentifierExpression("__aspectStrictEquals", range), null, assemblyscript_1.TypeNode.createFunctionType([
            // ref: T,
            assemblyscript_1.TypeNode.createParameter(assemblyscript_1.TypeNode.createIdentifierExpression("ref", range), assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName(classDeclaration.name.text, range), null, false, range), null, assemblyscript_1.ParameterKind.DEFAULT, range),
            // stack: usize[]
            assemblyscript_1.TypeNode.createParameter(assemblyscript_1.TypeNode.createIdentifierExpression("stack", range), 
            // Array<usize>
            assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName("Array", range), [assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName("usize", range), null, false, range)], false, range), null, assemblyscript_1.ParameterKind.DEFAULT, range),
            // cache: usize[]
            assemblyscript_1.TypeNode.createParameter(assemblyscript_1.TypeNode.createIdentifierExpression("cache", range), assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName("Array", range), [
                assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName("usize", range), null, false, range),
            ], false, range), null, assemblyscript_1.ParameterKind.DEFAULT, range),
        ], 
        // : bool
        assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName("bool", range), null, false, range), null, false, range), createFunctionBody(classDeclaration), null, assemblyscript_1.CommonFlags.PUBLIC | assemblyscript_1.CommonFlags.INSTANCE | (classDeclaration.isGeneric ? assemblyscript_1.CommonFlags.GENERIC_CONTEXT : 0), range);
    }
    exports.createMember = createMember;
    function createFunctionBody(classDeclaration) {
        var body = [];
        var range = classDeclaration.name.range;
        // for each field declaration, generate a check
        for (var _i = 0, _a = classDeclaration.members; _i < _a.length; _i++) {
            var member = _a[_i];
            switch (member.kind) {
                case assemblyscript_1.NodeKind.FIELDDECLARATION: {
                    if (member.is(assemblyscript_1.CommonFlags.INSTANCE) && !member.is(assemblyscript_1.CommonFlags.PRIVATE | assemblyscript_1.CommonFlags.PROTECTED)) {
                        var fieldDeclaration = member;
                        body.push(createIfCheck(member.name.text, fieldDeclaration.range));
                    }
                    break;
                }
                case assemblyscript_1.NodeKind.FUNCTIONDECLARATION: {
                    if (member.is(assemblyscript_1.CommonFlags.PUBLIC | assemblyscript_1.CommonFlags.GET)) {
                        var functionDeclaration = member;
                        body.push(createIfCheck(functionDeclaration.name.text, functionDeclaration.range));
                    }
                    break;
                }
            }
        }
        // return true
        body.push(assemblyscript_1.TypeNode.createReturnStatement(assemblyscript_1.TypeNode.createTrueExpression(range), range));
        return assemblyscript_1.TypeNode.createBlockStatement(body, range);
    }
    function createIfCheck(name, range) {
        // if (Reflect.equals(this.prop, ref.prop, stack, cache) === Reflect.FAIL) return false;
        return assemblyscript_1.TypeNode.createIfStatement(
        // Reflect.equals(this.prop, ref.prop, stack, cache) === Reflect.FAIL
        assemblyscript_1.TypeNode.createBinaryExpression(assemblyscript_1.Token.EQUALS_EQUALS_EQUALS, 
        // Reflect.equals(this.prop, ref.prop, stack, cache)
        assemblyscript_1.TypeNode.createCallExpression(assemblyscript_1.TypeNode.createPropertyAccessExpression(assemblyscript_1.TypeNode.createIdentifierExpression("Reflect", range), assemblyscript_1.TypeNode.createIdentifierExpression("equals", range), range), null, // types can be inferred by the compiler!
        // arguments
        [
            // this.prop
            assemblyscript_1.TypeNode.createPropertyAccessExpression(assemblyscript_1.TypeNode.createThisExpression(range), assemblyscript_1.TypeNode.createIdentifierExpression(name, range), range),
            // ref.prop
            assemblyscript_1.TypeNode.createPropertyAccessExpression(assemblyscript_1.TypeNode.createIdentifierExpression("ref", range), assemblyscript_1.TypeNode.createIdentifierExpression(name, range), range),
            // stack
            assemblyscript_1.TypeNode.createIdentifierExpression("stack", range),
            // cache
            assemblyscript_1.TypeNode.createIdentifierExpression("cache", range),
        ], range), assemblyscript_1.TypeNode.createPropertyAccessExpression(assemblyscript_1.TypeNode.createIdentifierExpression("Reflect", range), assemblyscript_1.TypeNode.createIdentifierExpression("FAIL", range), range), range), assemblyscript_1.TypeNode.createReturnStatement(assemblyscript_1.TypeNode.createFalseExpression(range), range), null, range);
    }
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiY3JlYXRlTWVtYmVyLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3RyYW5zZm9ybS9jcmVhdGVNZW1iZXIudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7SUFBQSxpREFhd0I7SUFFeEIsU0FBZ0IsWUFBWSxDQUFDLGdCQUFrQztRQUM3RCxJQUFNLEtBQUssR0FBRyxnQkFBZ0IsQ0FBQyxJQUFJLENBQUMsS0FBSyxDQUFDO1FBQzFDLHVFQUF1RTtRQUV2RSxPQUFPLHlCQUFRLENBQUMsdUJBQXVCLENBQ3JDLHlCQUFRLENBQUMsMEJBQTBCLENBQUMsc0JBQXNCLEVBQUUsS0FBSyxDQUFDLEVBQ2xFLElBQUksRUFDSix5QkFBUSxDQUFDLGtCQUFrQixDQUN6QjtZQUNFLFVBQVU7WUFDVix5QkFBUSxDQUFDLGVBQWUsQ0FDdEIseUJBQVEsQ0FBQywwQkFBMEIsQ0FBQyxLQUFLLEVBQUUsS0FBSyxDQUFDLEVBQ2pELHlCQUFRLENBQUMsZUFBZSxDQUN0Qix5QkFBUSxDQUFDLG9CQUFvQixDQUFDLGdCQUFnQixDQUFDLElBQUksQ0FBQyxJQUFJLEVBQUUsS0FBSyxDQUFDLEVBQ2hFLElBQUksRUFDSixLQUFLLEVBQ0wsS0FBSyxDQUNOLEVBQ0QsSUFBSSxFQUNKLDhCQUFhLENBQUMsT0FBTyxFQUNyQixLQUFLLENBQ047WUFDRCxpQkFBaUI7WUFDakIseUJBQVEsQ0FBQyxlQUFlLENBQ3RCLHlCQUFRLENBQUMsMEJBQTBCLENBQUMsT0FBTyxFQUFFLEtBQUssQ0FBQztZQUNuRCxlQUFlO1lBQ2YseUJBQVEsQ0FBQyxlQUFlLENBQ3RCLHlCQUFRLENBQUMsb0JBQW9CLENBQUMsT0FBTyxFQUFFLEtBQUssQ0FBQyxFQUM3QyxDQUFDLHlCQUFRLENBQUMsZUFBZSxDQUN2Qix5QkFBUSxDQUFDLG9CQUFvQixDQUFDLE9BQU8sRUFBRSxLQUFLLENBQUMsRUFDN0MsSUFBSSxFQUNKLEtBQUssRUFDTCxLQUFLLENBQ04sQ0FB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