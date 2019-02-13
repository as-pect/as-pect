declare module "test/TestResult" {
    export class TestResult {
        description: string;
        pass: boolean;
        time: number;
        actual: string;
        expected: string;
        reason: string;
    }
}
declare module "test/TestGroup" {
    import { TestResult } from "test/TestResult";
    export class TestGroup {
        describe: number;
        beforeAll: number;
        beforeEach: number;
        testFunctionPointers: number[];
        testNamePointers: number[];
        success: number;
        fail: number;
        total: number;
        afterEach: number;
        afterAll: number;
        todoPointers: number[];
        name: string;
        pass: boolean;
        time: number;
        results: TestResult[];
        todos: string[];
        reason: string;
    }
}
declare module "test/TestSuite" {
    import { TestGroup } from "test/TestGroup";
    export class TestSuite {
        groups: TestGroup[];
        total: number;
        success: number;
        fail: number;
        filename: string;
        time: number;
        passed: boolean;
    }
}
declare module "reporter/Reporter" {
    import { TestGroup } from "test/TestGroup";
    import { TestResult } from "test/TestResult";
    import { TestSuite } from "test/TestSuite";
    export abstract class Reporter {
        abstract onStart(suite: TestSuite): void;
        abstract onGroupStart(group: TestGroup): void;
        abstract onGroupFinish(group: TestGroup): void;
        abstract onTestStart(group: TestGroup, test: TestResult): void;
        abstract onTestFinish(group: TestGroup, test: TestResult): void;
        abstract onFinish(suite: TestSuite): void;
    }
}
declare module "reporter/DefaultReporter" {
    import { Reporter } from "reporter/Reporter";
    import { TestGroup } from "test/TestGroup";
    import { TestResult } from "test/TestResult";
    import { TestSuite } from "test/TestSuite";
    export class DefaultReporter extends Reporter {
        onStart(suite: TestSuite): void;
        onGroupStart(group: TestGroup): void;
        onGroupFinish(group: TestGroup): void;
        onTestStart(_group: TestGroup, _test: TestResult): void;
        onTestFinish(_group: TestGroup, test: TestResult): void;
        onFinish(suite: TestSuite): void;
    }
}
declare module "test/TestRunner" {
    import { TestSuite } from "test/TestSuite";
    import { ASUtil } from "assemblyscript/lib/loader";
    import { Reporter } from "reporter/Reporter";
    export class TestRunner {
        constructor();
        reason: string;
        suite: TestSuite | null;
        actual: string;
        expected: string;
        passed: boolean;
        wasm: ASUtil | null;
        createImports(imports?: any): any;
        run(filename: string, buffer: Uint8Array, imports?: any, reporter?: Reporter): void;
        tryCall(pointer: number): 1 | 0;
        reportDescribe(suiteName: number): void;
        reportTest(testName: number, callback: number): void;
        reportBeforeEach(cb: number): void;
        reportBeforeAll(cb: number): void;
        reportAfterEach(cb: number): void;
        reportAfterAll(cb: number): void;
        reportExpectedReference(expected: number, actual: number, offset: number, negated: number): void;
        reportExpectedValue(expected: number, actual: number, negated: number): void;
        reportTodo(description: number): void;
        reportExpectedNull(negated: number): void;
        clearExpected(): void;
        abort(reasonPointer: number, _fileNamePointer: number, _c: number, _d: number): void;
    }
}
declare module "util/IConfiguration" {
    import { Reporter } from "reporter/Reporter";
    export interface IConfiguration {
        include: string[];
        disclude?: RegExp[];
        imports?: any;
        reporter?: Reporter;
    }
}
declare module "cli" {
    export default function asp(args: string[]): void;
}
declare module "as-pect" {
    export * from "test/TestGroup";
    export * from "test/TestResult";
    export * from "test/TestRunner";
    export * from "test/TestSuite";
    export * from "util/IConfiguration";
    export * from "reporter/DefaultReporter";
    export * from "reporter/Reporter";
    import asp from "cli";
    export { asp };
}
declare module "test" { }
//# sourceMappingURL=as-pect.amd.d.ts.map