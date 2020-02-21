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
//# sourceMappingURL=createStrictEqualsMember.js.map