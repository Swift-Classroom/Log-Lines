import Testing
@testable import LogLines

struct LogLinesTests {
    
    @Test func testInitTraceTest() async throws {
        let line = "[TRC]: Line 84 - Console.WriteLine('Hello World');"
        #expect(LogLevel(line) == LogLevel.trace)
    }
    
    @Test func testInitDebugTest() async throws {
        let line = "[DBG]: ; expected"
        #expect(LogLevel(line) == LogLevel.debug)
    }
    
    @Test func testInitInfoTest() async throws {
        let line = "[INF]: Timezone changed"
        #expect(LogLevel(line) == LogLevel.info)
    }
    
    @Test func testInitWarningTest() async throws {
        let line = "[WRN]: Timezone not set"
        #expect(LogLevel(line) == LogLevel.warning)
    }
    
    @Test func testInitErrorTest() async throws {
        let line = "[ERR]: Disk full"
        #expect(LogLevel(line) == LogLevel.error)
    }
    
    @Test func testInitFatalTest() async throws {
        let line = "[FTL]: Not enough memory"
        #expect(LogLevel(line) == LogLevel.fatal)
    }
    
    @Test func testInitUnknownEmptyTest() async throws {
        let line = "Something terrible has happened!"
        #expect(LogLevel(line) == LogLevel.unknown)
    }
    
    @Test func testInitUnknownNonStandardTest() async throws {
        let line = "[XYZ]: Gibberish message.. beep boop.."
        #expect(LogLevel(line) == LogLevel.unknown)
    }
    
    @Test func testShortTraceTest() async throws {
        let message = "Line 13 - int myNum = 42;"
        #expect(LogLevel.trace.shortFormat(message: message) == "0:Line 13 - int myNum = 42;")
    }
    
    @Test func testShortDebugTest() async throws {
        let message = "The name 'LogLevel' does not exist in the current context"
        #expect(LogLevel.debug.shortFormat(message: message) ==
                "1:The name 'LogLevel' does not exist in the current context")
    }
    
    @Test func testShortInfoTest() async throws {
        let message = "File moved"
        #expect(LogLevel.info.shortFormat(message: message) == "4:File moved")
    }
    
    @Test func testShortWarningTest() async throws {
        let message = "Unsafe password"
        #expect(LogLevel.warning.shortFormat(message: message) == "5:Unsafe password")
    }
    
    @Test func testShortErrorTest() async throws {
        let message = "Stack overflow"
        #expect(LogLevel.error.shortFormat(message: message) == "6:Stack overflow")
    }
    
    @Test func testShortFatalTest() async throws {
        let message = "Dumping all files"
        #expect(LogLevel.fatal.shortFormat(message: message) == "7:Dumping all files")
    }
    
    @Test func testShortUnknownEmptyTest() async throws {
        let message = "Wha happon?"
        #expect(LogLevel.unknown.shortFormat(message: message) == "42:Wha happon?")
    }
}
