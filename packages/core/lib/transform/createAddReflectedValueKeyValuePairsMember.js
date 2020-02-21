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
    function createAddReflectedValueKeyValuePairsMember(classDeclaration) {
        var range = classDeclaration.name.range;
        // __aspectAddReflectedValueKeyValuePairs(reflectedValue: i32, seen: Map<usize, i32>, forDisplay: bool): void
        return assemblyscript_1.TypeNode.createMethodDeclaration(assemblyscript_1.TypeNode.createIdentifierExpression("__aspectAddReflectedValueKeyValuePairs", range), null, assemblyscript_1.TypeNode.createFunctionType([
            // reflectedValue: i32
            assemblyscript_1.TypeNode.createParameter(assemblyscript_1.TypeNode.createIdentifierExpression("reflectedValue", range), createGenericTypeParameter_1.createGenericTypeParameter("i32", range), null, assemblyscript_1.ParameterKind.DEFAULT, range),
            // seen: Map<usize, i32>
            assemblyscript_1.TypeNode.createParameter(assemblyscript_1.TypeNode.createIdentifierExpression("seen", range), assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName("Map", range), [
                createGenericTypeParameter_1.createGenericTypeParameter("usize", range),
                createGenericTypeParameter_1.createGenericTypeParameter("i32", range),
            ], false, range), null, assemblyscript_1.ParameterKind.DEFAULT, range),
            // forDisplay: bool
            assemblyscript_1.TypeNode.createParameter(assemblyscript_1.TypeNode.createIdentifierExpression("forDisplay", range), createGenericTypeParameter_1.createGenericTypeParameter("bool", range), null, assemblyscript_1.ParameterKind.DEFAULT, range),
        ], assemblyscript_1.TypeNode.createNamedType(assemblyscript_1.TypeNode.createSimpleTypeName("void", range), [], false, range), null, false, range), createAddReflectedValueKeyValuePairsFunctionBody(classDeclaration), null, assemblyscript_1.CommonFlags.PUBLIC |
            assemblyscript_1.CommonFlags.INSTANCE |
            (classDeclaration.isGeneric ? assemblyscript_1.CommonFlags.GENERIC_CONTEXT : 0), range);
    }
    exports.createAddReflectedValueKeyValuePairsMember = createAddReflectedValueKeyValuePairsMember;
    function createAddReflectedValueKeyValuePairsFunctionBody(classDeclaration) {
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
                        body.push(createPushReflectedObjectKeyStatement(member.name.text, fieldDeclaration.range));
                        body.push(createPushReflectedObjectValueStatement(member.name.text, fieldDeclaration.range));
                        break;
                    }
                    // function declarations can be getters, check the get flag
                    case assemblyscript_1.NodeKind.FUNCTIONDECLARATION: {
                        if (member.is(assemblyscript_1.CommonFlags.GET)) {
                            var functionDeclaration = member;
                            body.push(createPushReflectedObjectKeyStatement(functionDeclaration.name.text, functionDeclaration.range));
                            body.push(createPushReflectedObjectValueStatement(functionDeclaration.name.text, functionDeclaration.range));
                        }
                        break;
                    }
                }
            }
        }
        return assemblyscript_1.TypeNode.createBlockStatement(body, range);
    }
    // __aspectPushReflectedObjectKey
    function createPushReflectedObjectKeyStatement(name, range) {
        // __aspectPushReflectedObjectKey(reflectedValue, Reflect.toReflectedValue("propertyName", seen));
        return assemblyscript_1.TypeNode.createExpressionStatement(assemblyscript_1.TypeNode.createCallExpression(assemblyscript_1.TypeNode.createIdentifierExpression("__aspectPushReflectedObjectKey", range), null, [
            // reflectedValue
            assemblyscript_1.TypeNode.createIdentifierExpression("reflectedValue", range),
            // Reflect.toReflectedValue("propertyName", seen)
            assemblyscript_1.TypeNode.createCallExpression(
            // Reflect.toReflectedValue
            assemblyscript_1.TypeNode.createPropertyAccessExpression(assemblyscript_1.TypeNode.createIdentifierExpression("Reflect", range), assemblyscript_1.TypeNode.createIdentifierExpression("toReflectedValue", range), range), null, [
                // property name
                assemblyscript_1.TypeNode.createStringLiteralExpression(name, range),
                // seen
                assemblyscript_1.TypeNode.createIdentifierExpression("seen", range),
                // forDisplay
                assemblyscript_1.TypeNode.createIdentifierExpression("forDisplay", range),
            ], range),
        ], range));
    }
    function createPushReflectedObjectValueStatement(name, range) {
        // __aspectPushReflectedObjectValue(reflectedValue, Reflect.toReflectedValue(this.propertyName, seen));
        return assemblyscript_1.TypeNode.createExpressionStatement(
        // __aspectPushReflectedObjectValue(reflectedValue, Reflect.toReflectedValue(this.propertyName, seen))
        assemblyscript_1.TypeNode.createCallExpression(
        // __aspectPushReflectedObjectValue
        assemblyscript_1.TypeNode.createIdentifierExpression("__aspectPushReflectedObjectValue", range), null, [
            // reflectedValue
            assemblyscript_1.TypeNode.createIdentifierExpression("reflectedValue", range),
            // Reflect.toReflectedValue(this.propertyName, seen))
            assemblyscript_1.TypeNode.createCallExpression(
            // Reflect.toReflectedValue
            assemblyscript_1.TypeNode.createPropertyAccessExpression(assemblyscript_1.TypeNode.createIdentifierExpression("Reflect", range), assemblyscript_1.TypeNode.createIdentifierExpression("toReflectedValue", range), range), null, [
                //this.propertyName
                assemblyscript_1.TypeNode.createPropertyAccessExpression(assemblyscript_1.TypeNode.createThisExpression(range), assemblyscript_1.TypeNode.createIdentifierExpression(name, range), range),
                // seen
                assemblyscript_1.TypeNode.createIdentifierExpression("seen", range),
                // forDisplay
                assemblyscript_1.TypeNode.createIdentifierExpression("forDisplay", range),
            ], range),
        ], range));
    }
});
//# sourceMappingURL=createAddReflectedValueKeyValuePairsMember.js.map