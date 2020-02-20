(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "./assemblyscript", "./createGenericTypeParameter"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var assemblyscript_1 = require("./assemblyscript");
    var createGenericTypeParameter_1 = require("./createGenericTypeParameter");
    /**
     * This method creates a single FunctionDeclaration that allows Reflect.equals
     * to validate normal class member values.
     *
     * @param {ClassDeclaration} classDeclaration - The class that requires a new function.
     */
    function createStrictEqualsMember(classDeclaration) {
        var range = classDeclaration.name.range;
        // __aspectStrictEquals(ref: T, stackA: usize[], stackB: usize[]): bool
        return assemblyscript_1.TypeNode.createMethodDeclaration(assemblyscript_1.TypeNode.createIdentifierExpression("__aspectStrictEquals", range), [
            assemblyscript_1.TypeNode.createTypeParameter(assemblyscript_1.TypeNode.createIdentifierExpression("T", range), null, null, range),
        ], assemblyscript_1.TypeNode.createFunctionType([
            // ref: T,
            createDefaultParameter("ref", createGenericTypeParameter_1.createGenericTypeParameter("T", range), range),
            // stack: usize[]
            createDefaultParameter("stack", createUsizeArrayType(range), range),
            // cache: usize[]
            createDefaultParameter("cache", createUsizeArrayType(range), range),
        ], 
        // : bool
        createSimpleNamedType("bool", range), null, false, range), createStrictEqualsFunctionBody(classDeclaration), null, assemblyscript_1.CommonFlags.PUBLIC |
            assemblyscript_1.CommonFlags.INSTANCE |
            assemblyscript_1.CommonFlags.GENERIC |
            (classDeclaration.isGeneric ? assemblyscript_1.CommonFlags.GENERIC_CONTEXT : 0), range);
    }
    exports.createStrictEqualsMember = createStrictEqualsMember;
    /**
     * This method creates a simple name type with the given name and source range.
     *
     * @param {string} name - The name of the type.
     * @param {Range} range - The given source range.
     */
    function createSimpleNamedType(name, range) {
        return assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName(name, range), null, false, range);
    }
    /**
     * This method creates an Array<usize> type with the given range.
     *
     * @param {Range} range - The source range.
     */
    function createUsizeArrayType(range) {
        return assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName("Array", range), [
            assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName("usize", range), null, false, range),
        ], false, range);
    }
    /**
     * This method creates the entire function body for __aspectStrictEquals.
     *
     * @param {ClassDeclaration} classDeclaration - The class declaration.
     */
    function createStrictEqualsFunctionBody(classDeclaration) {
        var body = new Array();
        var range = classDeclaration.name.range;
        // for each field declaration, generate a check
        for (var _i = 0, _a = classDeclaration.members; _i < _a.length; _i++) {
            var member = _a[_i];
            // if it's an instance member, and it isn't marked private or protected
            if (member.is(assemblyscript_1.CommonFlags.INSTANCE) &&
                !member.is(assemblyscript_1.CommonFlags.PRIVATE | assemblyscript_1.CommonFlags.PROTECTED)) {
                switch (member.kind) {
                    // field declarations automatically get added
                    case assemblyscript_1.NodeKind.FIELDDECLARATION: {
                        var fieldDeclaration = member;
                        body.push(createStrictEqualsIfCheck(member.name.text, fieldDeclaration.range));
                        break;
                    }
                    // function declarations can be getters, check the get flag
                    case assemblyscript_1.NodeKind.FUNCTIONDECLARATION: {
                        if (member.is(assemblyscript_1.CommonFlags.GET)) {
                            var functionDeclaration = member;
                            body.push(createStrictEqualsIfCheck(functionDeclaration.name.text, functionDeclaration.range));
                        }
                        break;
                    }
                }
            }
        }
        // return true;
        body.push(assemblyscript_1.TypeNode.createReturnStatement(assemblyscript_1.TypeNode.createTrueExpression(range), range));
        return assemblyscript_1.TypeNode.createBlockStatement(body, range);
    }
    /**
     * This function generates a single IfStatement with a nested ReturnStatement
     * to validate a nested property on a given class.
     *
     * @param {string} name - The name of the property.
     * @param {Range} range - The source range for the given property.
     */
    function createStrictEqualsIfCheck(name, range) {
        // if (Reflect.equals(this.prop, ref.prop, stack, cache) === Reflect.FAILED_MATCH) return false;
        return assemblyscript_1.TypeNode.createIfStatement(
        // Reflect.equals(this.prop, ref.prop, stack, cache) === Reflect.FAILED_MATCH
        assemblyscript_1.TypeNode.createBinaryExpression(assemblyscript_1.Token.EQUALS_EQUALS_EQUALS, 
        // Reflect.equals(this.prop, ref.prop, stack, cache)
        assemblyscript_1.TypeNode.createCallExpression(
        // Reflect.equals
        createPropertyAccess("Reflect", "equals", range), null, // types can be inferred by the compiler!
        // arguments
        [
            // this.prop
            assemblyscript_1.TypeNode.createPropertyAccessExpression(assemblyscript_1.TypeNode.createThisExpression(range), assemblyscript_1.TypeNode.createIdentifierExpression(name, range), range),
            // ref.prop
            createPropertyAccess("ref", name, range),
            // stack
            assemblyscript_1.TypeNode.createIdentifierExpression("stack", range),
            // cache
            assemblyscript_1.TypeNode.createIdentifierExpression("cache", range),
        ], range), createPropertyAccess("Reflect", "FAILED_MATCH", range), range), 
        // return false;
        assemblyscript_1.TypeNode.createReturnStatement(assemblyscript_1.TypeNode.createFalseExpression(range), range), null, range);
    }
    /**
     * Create a simple default parameter with a name and a type.
     *
     * @param {string} name - The name of the parameter.
     * @param {TypeNode} typeNode - The type of the parameter.
     * @param {Range} range - The source range of the parameter.
     */
    function createDefaultParameter(name, typeNode, range) {
        return assemblyscript_1.TypeNode.createParameter(assemblyscript_1.TypeNode.createIdentifierExpression(name, range), typeNode, null, assemblyscript_1.ParameterKind.DEFAULT, range);
    }
    /**
     * This method creates a single property access and passes the given range to the AST.
     *
     * @param {string} root - The name of the identifier representing the root.
     * @param {string} property - The name of the identifier representing the property.
     * @param {Range} range - The range of the property access.
     */
    function createPropertyAccess(root, property, range) {
        // root.property
        return assemblyscript_1.TypeNode.createPropertyAccessExpression(assemblyscript_1.TypeNode.createIdentifierExpression(root, range), assemblyscript_1.TypeNode.createIdentifierExpression(property, range), range);
    }
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiY3JlYXRlU3RyaWN0RXF1YWxzTWVtYmVyLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL3RyYW5zZm9ybS9jcmVhdGVTdHJpY3RFcXVhbHNNZW1iZXIudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7SUFBQSxtREFlMEI7SUFDMUIsMkVBQTBFO0lBRTFFOzs7OztPQUtHO0lBQ0gsU0FBZ0Isd0JBQXdCLENBQ3RDLGdCQUFrQztRQUVsQyxJQUFNLEtBQUssR0FBRyxnQkFBZ0IsQ0FBQyxJQUFJLENBQUMsS0FBSyxDQUFDO1FBRTFDLHVFQUF1RTtRQUN2RSxPQUFPLHlCQUFRLENBQUMsdUJBQXVCLENBQ3JDLHlCQUFRLENBQUMsMEJBQTBCLENBQUMsc0JBQXNCLEVBQUUsS0FBSyxDQUFDLEVBQ2xFO1lBQ0UseUJBQVEsQ0FBQyxtQkFBbUIsQ0FDMUIseUJBQVEsQ0FBQywwQkFBMEIsQ0FBQyxHQUFHLEVBQUUsS0FBSyxDQUFDLEVBQy9DLElBQUksRUFDSixJQUFJLEVBQ0osS0FBSyxDQUNOO1NBQ0YsRUFDRCx5QkFBUSxDQUFDLGtCQUFrQixDQUN6QjtZQUNFLFVBQVU7WUFDVixzQkFBc0IsQ0FDcEIsS0FBSyxFQUNMLHVEQUEwQixDQUFDLEdBQUcsRUFBRSxLQUFLLENBQUMsRUFDdEMsS0FBSyxDQUNOO1lBQ0QsaUJBQWlCO1lBQ2pCLHNCQUFzQixDQUFDLE9BQU8sRUFBRSxvQkFBb0IsQ0FBQyxLQUFLLENBQUMsRUFBRSxLQUFLLENBQUM7WUFDbkUsaUJBQWlCO1lBQ2pCLHNCQUFzQixDQUFDLE9BQU8sRUFBRSxvQkFBb0IsQ0FBQyxLQUFLLENBQUMsRUFBRSxLQUFLLENBQUM7U0FDcEU7UUFDRCxTQUFTO1FBQ1QscUJBQXFCLENBQUMsTUFBTSxFQUFFLEtBQUssQ0FBQyxFQUNwQyxJQUFJLEVBQ0osS0FBSyxFQUNMLEtBQUssQ0FDTixFQUNELDhCQUE4QixDQUFDLGdCQUFnQixDQUFDLEVBQ2hELElBQUksRUFD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