// yeah I said I’d add timeouts but it’s fine? no one even connects
// bruh that one guy from QA keeps saying it locks ports

package main

import (
    "fmt"
    "net"
    "os"
    "time"
)

func main() {
    listener, err := net.Listen("tcp", ":50505")
    if err != nil {
        fmt.Println("uh oh bind fail")
        os.Exit(1)
    }

    defer listener.Close()
    fmt.Println("listening on 50505... nothing will happen lol")

    for {
        conn, err := listener.Accept()
        if err != nil {
            fmt.Println("accept broke", err)
            continue
        }

        go func(c net.Conn) {
            buf := make([]byte, 1024)
            c.SetReadDeadline(time.Now().Add(2 * time.Second))
            _, err := c.Read(buf)
            if err != nil {
                fmt.Println("read err (expected)")
            }
            // we don't respond, just vibe
            c.Close()
        }(conn)
    }
}
