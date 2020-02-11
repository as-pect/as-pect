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
            assemblyscript_1.TypeNode.createParameter(assemblyscript_1.TypeNode.createIdentifierExpression("ref", range), assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName(classDeclaration.name.text, range), null, true, range), null, assemblyscript_1.ParameterKind.DEFAULT, range),
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
        assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName("bool", range), null, false, range), null, false, range), createFunctionBody(classDeclaration), null, assemblyscript_1.CommonFlags.PUBLIC | assemblyscript_1.CommonFlags.INSTANCE, range);
    }
    exports.createMember = createMember;
    function createFunctionBody(classDeclaration) {
        var body = [];
        var range = classDeclaration.name.range;
        // if (this === ref) return true;
        body.push(createExactEqualCheck(classDeclaration));
        //if (i32(this === null) ^ i32(ref === null)) return false;
        body.push(createNullCheck(classDeclaration));
        // for each field declaration, generate a check
        for (var _i = 0, _a = classDeclaration.members; _i < _a.length; _i++) {
            var member = _a[_i];
            switch (member.kind) {
                case assemblyscript_1.NodeKind.FIELDDECLARATION: {
                    if (member.is(assemblyscript_1.CommonFlags.PUBLIC)) {
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
    function createNullCheck(classDeclaration) {
        var range = classDeclaration.name.range;
        return assemblyscript_1.TypeNode.createIfStatement(
        // i32(this === null) ^ i32(ref === null)
        assemblyscript_1.TypeNode.createBinaryExpression(assemblyscript_1.Token.CARET, 
        // i32(this === null)
        assemblyscript_1.TypeNode.createCallExpression(assemblyscript_1.TypeNode.createIdentifierExpression("i32", range), null, [assemblyscript_1.TypeNode.createBinaryExpression(assemblyscript_1.Token.EQUALS_EQUALS_EQUALS, assemblyscript_1.TypeNode.createThisExpression(range), assemblyscript_1.TypeNode.createNullExpression(range), range)], range), 
        // i32(ref === null)
        assemblyscript_1.TypeNode.createCallExpression(assemblyscript_1.TypeNode.createIdentifierExpression("i32", range), null, [assemblyscript_1.TypeNode.createBinaryExpression(assemblyscript_1.Token.EQUALS_EQUALS_EQUALS, assemblyscript_1.TypeNode.createIdentifierExpression("ref", range), assemblyscript_1.TypeNode.createNullExpression(range), range)], range), range), assemblyscript_1.TypeNode.createReturnStatement(assemblyscript_1.TypeNode.createFalseExpression(range), range), null, range);
    }
    function createExactEqualCheck(classDeclaration) {
        var range = classDeclaration.name.range;
        // if (this === ref) return true;
        return assemblyscript_1.TypeNode.createIfStatement(assemblyscript_1.TypeNode.createBinaryExpression(assemblyscript_1.Token.EQUALS_EQUALS_EQUALS, assemblyscript_1.TypeNode.createThisExpression(range), assemblyscript_1.TypeNode.createIdentifierExpression("ref", range), range), 
        // return true
        assemblyscript_1.TypeNode.createReturnStatement(assemblyscript_1.TypeNode.createTrueExpression(range), range), null, range);
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
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiY3JlYXRlTWVtYmVyLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3RyYW5zZm9ybS9jcmVhdGVNZW1iZXIudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7SUFBQSxpREFhd0I7SUFFeEIsU0FBZ0IsWUFBWSxDQUFDLGdCQUFrQztRQUM3RCxJQUFNLEtBQUssR0FBRyxnQkFBZ0IsQ0FBQyxJQUFJLENBQUMsS0FBSyxDQUFDO1FBQzFDLHVFQUF1RTtRQUV2RSxPQUFPLHlCQUFRLENBQUMsdUJBQXVCLENBQ3JDLHlCQUFRLENBQUMsMEJBQTBCLENBQUMsc0JBQXNCLEVBQUUsS0FBSyxDQUFDLEVBQ2xFLElBQUksRUFDSix5QkFBUSxDQUFDLGtCQUFrQixDQUN6QjtZQUNFLFVBQVU7WUFDVix5QkFBUSxDQUFDLGVBQWUsQ0FDdEIseUJBQVEsQ0FBQywwQkFBMEIsQ0FBQyxLQUFLLEVBQUUsS0FBSyxDQUFDLEVBQ2pELHlCQUFRLENBQUMsZUFBZSxDQUN0Qix5QkFBUSxDQUFDLG9CQUFvQixDQUFDLGdCQUFnQixDQUFDLElBQUksQ0FBQyxJQUFJLEVBQUUsS0FBSyxDQUFDLEVBQ2hFLElBQUksRUFDSixJQUFJLEVBQ0osS0FBSyxDQUNOLEVBQ0QsSUFBSSxFQUNKLDhCQUFhLENBQUMsT0FBTyxFQUNyQixLQUFLLENBQ047WUFDRCxpQkFBaUI7WUFDakIseUJBQVEsQ0FBQyxlQUFlLENBQ3RCLHlCQUFRLENBQUMsMEJBQTBCLENBQUMsT0FBTyxFQUFFLEtBQUssQ0FBQztZQUNuRCxlQUFlO1lBQ2YseUJBQVEsQ0FBQyxlQUFlLENBQ3RCLHlCQUFRLENBQUMsb0JBQW9CLENBQUMsT0FBTyxFQUFFLEtBQUssQ0FBQyxFQUM3QyxDQUFDLHlCQUFRLENBQUMsZUFBZSxDQUN2Qix5QkFBUSxDQUFDLG9CQUFvQixDQUFDLE9BQU8sRUFBRSxLQUFLLENBQUMsRUFDN0MsSUFBSSxFQUNKLEtBQUssRUFDTCxLQUFLLENBQ04sQ0FB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