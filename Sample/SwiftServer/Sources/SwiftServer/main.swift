import SmokeOperationsHTTP1
import SmokeOperationsHTTP1Server
import AsyncHTTPClient
import NIO
import SmokeHTTP1

struct LevelUpInvocationContextInitializer: SmokeServerPerInvocationContextInitializer {

    typealias SelectorType =
        StandardSmokeHTTP1HandlerSelector<ApplicationContext,
        MyOperationDelegate,
        ModelOperations>
    
    let handlerSelector: SelectorType
    

    let applicationContext = ApplicationContext()
    

    init(eventLoop: EventLoop) throws {
        var selector = SelectorType(
            defaultOperationDelegate: JSONPayloadHTTP1OperationDelegate()
        )
        addOperations(selector: &selector)
        
        self.handlerSelector = selector
    }
    

    public func getInvocationContext(
        invocationReporting: SmokeServerInvocationReporting<SmokeInvocationTraceContext>)
        -> ApplicationContext {
            applicationContext
    }
    

    func onShutdown() throws {}
}


typealias MyOperationDelegate =
    JSONPayloadHTTP1OperationDelegate<SmokeInvocationTraceContext>



SmokeHTTP1Server.runAsOperationServer(LevelUpInvocationContextInitializer.init)
