package main

import (
       "log"
       "net/http"
       "github.com/rs/cors"
       "github.com/googollee/go-socket.io"
)

func main() {
       server, err := socketio.NewServer(nil)
       if err != nil {
              log.Fatal(err)
       }
    
       c := cors.New(cors.Options{
              AllowedOrigins:   []string{"*"},
              AllowCredentials: true,
       })
    
       server.On("connection", func(so socketio.Socket) {
              log.Println("on connection")
              so.Join("chat")
              so.On("chat message", func(msg string) {
                     //log.Println("emit:", so.Emit("chat message", msg))
                     so.BroadcastTo("chat", "chat message", msg)
              })
    
              so.On("chat ack", func(msg string) string {
                     return msg
              })
              so.On("disconnection", func() {
                     log.Println("on disconnect")
              })
       })
       server.On("error", func(so socketio.Socket, err error) {
              log.Println("error:", err)
       })
    
       http.Handle("/socket.io/", c.Handler(server))
       log.Println("Serving at localhost:8000...")
       log.Fatal(http.ListenAndServe(":8000", nil))
}