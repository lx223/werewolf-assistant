// Code generated by protoc-gen-go. DO NOT EDIT.
// source: room/room.proto

package room

import proto "github.com/golang/protobuf/proto"
import fmt "fmt"
import math "math"

import (
	context "golang.org/x/net/context"
	grpc "google.golang.org/grpc"
)

// Reference imports to suppress errors if they are not otherwise used.
var _ = proto.Marshal
var _ = fmt.Errorf
var _ = math.Inf

// This is a compile-time assertion to ensure that this generated file
// is compatible with the proto package it is being compiled against.
// A compilation error at this line likely means your copy of the
// proto package needs to be updated.
const _ = proto.ProtoPackageIsVersion2 // please upgrade the proto package

type Room struct {
	Id                   int32    `protobuf:"varint,1,opt,name=id,proto3" json:"id,omitempty"`
	Users                []*User  `protobuf:"bytes,2,rep,name=users,proto3" json:"users,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *Room) Reset()         { *m = Room{} }
func (m *Room) String() string { return proto.CompactTextString(m) }
func (*Room) ProtoMessage()    {}
func (*Room) Descriptor() ([]byte, []int) {
	return fileDescriptor_room_5eeb18644ef725f4, []int{0}
}
func (m *Room) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_Room.Unmarshal(m, b)
}
func (m *Room) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_Room.Marshal(b, m, deterministic)
}
func (dst *Room) XXX_Merge(src proto.Message) {
	xxx_messageInfo_Room.Merge(dst, src)
}
func (m *Room) XXX_Size() int {
	return xxx_messageInfo_Room.Size(m)
}
func (m *Room) XXX_DiscardUnknown() {
	xxx_messageInfo_Room.DiscardUnknown(m)
}

var xxx_messageInfo_Room proto.InternalMessageInfo

func (m *Room) GetId() int32 {
	if m != nil {
		return m.Id
	}
	return 0
}

func (m *Room) GetUsers() []*User {
	if m != nil {
		return m.Users
	}
	return nil
}

type User struct {
	Id                   string   `protobuf:"bytes,1,opt,name=id,proto3" json:"id,omitempty"`
	ImgUrl               string   `protobuf:"bytes,2,opt,name=img_url,json=imgUrl,proto3" json:"img_url,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *User) Reset()         { *m = User{} }
func (m *User) String() string { return proto.CompactTextString(m) }
func (*User) ProtoMessage()    {}
func (*User) Descriptor() ([]byte, []int) {
	return fileDescriptor_room_5eeb18644ef725f4, []int{1}
}
func (m *User) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_User.Unmarshal(m, b)
}
func (m *User) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_User.Marshal(b, m, deterministic)
}
func (dst *User) XXX_Merge(src proto.Message) {
	xxx_messageInfo_User.Merge(dst, src)
}
func (m *User) XXX_Size() int {
	return xxx_messageInfo_User.Size(m)
}
func (m *User) XXX_DiscardUnknown() {
	xxx_messageInfo_User.DiscardUnknown(m)
}

var xxx_messageInfo_User proto.InternalMessageInfo

func (m *User) GetId() string {
	if m != nil {
		return m.Id
	}
	return ""
}

func (m *User) GetImgUrl() string {
	if m != nil {
		return m.ImgUrl
	}
	return ""
}

type CreateRoomRequest struct {
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *CreateRoomRequest) Reset()         { *m = CreateRoomRequest{} }
func (m *CreateRoomRequest) String() string { return proto.CompactTextString(m) }
func (*CreateRoomRequest) ProtoMessage()    {}
func (*CreateRoomRequest) Descriptor() ([]byte, []int) {
	return fileDescriptor_room_5eeb18644ef725f4, []int{2}
}
func (m *CreateRoomRequest) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_CreateRoomRequest.Unmarshal(m, b)
}
func (m *CreateRoomRequest) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_CreateRoomRequest.Marshal(b, m, deterministic)
}
func (dst *CreateRoomRequest) XXX_Merge(src proto.Message) {
	xxx_messageInfo_CreateRoomRequest.Merge(dst, src)
}
func (m *CreateRoomRequest) XXX_Size() int {
	return xxx_messageInfo_CreateRoomRequest.Size(m)
}
func (m *CreateRoomRequest) XXX_DiscardUnknown() {
	xxx_messageInfo_CreateRoomRequest.DiscardUnknown(m)
}

var xxx_messageInfo_CreateRoomRequest proto.InternalMessageInfo

type CreateRoomResponse struct {
	RoomId               int32    `protobuf:"varint,1,opt,name=room_id,json=roomId,proto3" json:"room_id,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *CreateRoomResponse) Reset()         { *m = CreateRoomResponse{} }
func (m *CreateRoomResponse) String() string { return proto.CompactTextString(m) }
func (*CreateRoomResponse) ProtoMessage()    {}
func (*CreateRoomResponse) Descriptor() ([]byte, []int) {
	return fileDescriptor_room_5eeb18644ef725f4, []int{3}
}
func (m *CreateRoomResponse) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_CreateRoomResponse.Unmarshal(m, b)
}
func (m *CreateRoomResponse) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_CreateRoomResponse.Marshal(b, m, deterministic)
}
func (dst *CreateRoomResponse) XXX_Merge(src proto.Message) {
	xxx_messageInfo_CreateRoomResponse.Merge(dst, src)
}
func (m *CreateRoomResponse) XXX_Size() int {
	return xxx_messageInfo_CreateRoomResponse.Size(m)
}
func (m *CreateRoomResponse) XXX_DiscardUnknown() {
	xxx_messageInfo_CreateRoomResponse.DiscardUnknown(m)
}

var xxx_messageInfo_CreateRoomResponse proto.InternalMessageInfo

func (m *CreateRoomResponse) GetRoomId() int32 {
	if m != nil {
		return m.RoomId
	}
	return 0
}

type JoinRoomRequest struct {
	RoomId int32 `protobuf:"varint,1,opt,name=room_id,json=roomId,proto3" json:"room_id,omitempty"`
	// If unset, server will assign a random user id.
	// If set, server will try to assign the given id to the caller.
	// If the given id hasn't been used by server, server will return PermissionDenied error.
	UserId               string   `protobuf:"bytes,2,opt,name=user_id,json=userId,proto3" json:"user_id,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *JoinRoomRequest) Reset()         { *m = JoinRoomRequest{} }
func (m *JoinRoomRequest) String() string { return proto.CompactTextString(m) }
func (*JoinRoomRequest) ProtoMessage()    {}
func (*JoinRoomRequest) Descriptor() ([]byte, []int) {
	return fileDescriptor_room_5eeb18644ef725f4, []int{4}
}
func (m *JoinRoomRequest) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_JoinRoomRequest.Unmarshal(m, b)
}
func (m *JoinRoomRequest) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_JoinRoomRequest.Marshal(b, m, deterministic)
}
func (dst *JoinRoomRequest) XXX_Merge(src proto.Message) {
	xxx_messageInfo_JoinRoomRequest.Merge(dst, src)
}
func (m *JoinRoomRequest) XXX_Size() int {
	return xxx_messageInfo_JoinRoomRequest.Size(m)
}
func (m *JoinRoomRequest) XXX_DiscardUnknown() {
	xxx_messageInfo_JoinRoomRequest.DiscardUnknown(m)
}

var xxx_messageInfo_JoinRoomRequest proto.InternalMessageInfo

func (m *JoinRoomRequest) GetRoomId() int32 {
	if m != nil {
		return m.RoomId
	}
	return 0
}

func (m *JoinRoomRequest) GetUserId() string {
	if m != nil {
		return m.UserId
	}
	return ""
}

type JoinRoomResponse struct {
	UserId               string   `protobuf:"bytes,1,opt,name=user_id,json=userId,proto3" json:"user_id,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *JoinRoomResponse) Reset()         { *m = JoinRoomResponse{} }
func (m *JoinRoomResponse) String() string { return proto.CompactTextString(m) }
func (*JoinRoomResponse) ProtoMessage()    {}
func (*JoinRoomResponse) Descriptor() ([]byte, []int) {
	return fileDescriptor_room_5eeb18644ef725f4, []int{5}
}
func (m *JoinRoomResponse) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_JoinRoomResponse.Unmarshal(m, b)
}
func (m *JoinRoomResponse) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_JoinRoomResponse.Marshal(b, m, deterministic)
}
func (dst *JoinRoomResponse) XXX_Merge(src proto.Message) {
	xxx_messageInfo_JoinRoomResponse.Merge(dst, src)
}
func (m *JoinRoomResponse) XXX_Size() int {
	return xxx_messageInfo_JoinRoomResponse.Size(m)
}
func (m *JoinRoomResponse) XXX_DiscardUnknown() {
	xxx_messageInfo_JoinRoomResponse.DiscardUnknown(m)
}

var xxx_messageInfo_JoinRoomResponse proto.InternalMessageInfo

func (m *JoinRoomResponse) GetUserId() string {
	if m != nil {
		return m.UserId
	}
	return ""
}

func init() {
	proto.RegisterType((*Room)(nil), "room.Room")
	proto.RegisterType((*User)(nil), "room.User")
	proto.RegisterType((*CreateRoomRequest)(nil), "room.CreateRoomRequest")
	proto.RegisterType((*CreateRoomResponse)(nil), "room.CreateRoomResponse")
	proto.RegisterType((*JoinRoomRequest)(nil), "room.JoinRoomRequest")
	proto.RegisterType((*JoinRoomResponse)(nil), "room.JoinRoomResponse")
}

// Reference imports to suppress errors if they are not otherwise used.
var _ context.Context
var _ grpc.ClientConn

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
const _ = grpc.SupportPackageIsVersion4

// RoomServiceClient is the client API for RoomService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://godoc.org/google.golang.org/grpc#ClientConn.NewStream.
type RoomServiceClient interface {
	CreateRoom(ctx context.Context, in *CreateRoomRequest, opts ...grpc.CallOption) (*CreateRoomResponse, error)
	JoinRoom(ctx context.Context, in *JoinRoomRequest, opts ...grpc.CallOption) (*JoinRoomResponse, error)
}

type roomServiceClient struct {
	cc *grpc.ClientConn
}

func NewRoomServiceClient(cc *grpc.ClientConn) RoomServiceClient {
	return &roomServiceClient{cc}
}

func (c *roomServiceClient) CreateRoom(ctx context.Context, in *CreateRoomRequest, opts ...grpc.CallOption) (*CreateRoomResponse, error) {
	out := new(CreateRoomResponse)
	err := c.cc.Invoke(ctx, "/room.RoomService/CreateRoom", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *roomServiceClient) JoinRoom(ctx context.Context, in *JoinRoomRequest, opts ...grpc.CallOption) (*JoinRoomResponse, error) {
	out := new(JoinRoomResponse)
	err := c.cc.Invoke(ctx, "/room.RoomService/JoinRoom", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// RoomServiceServer is the server API for RoomService service.
type RoomServiceServer interface {
	CreateRoom(context.Context, *CreateRoomRequest) (*CreateRoomResponse, error)
	JoinRoom(context.Context, *JoinRoomRequest) (*JoinRoomResponse, error)
}

func RegisterRoomServiceServer(s *grpc.Server, srv RoomServiceServer) {
	s.RegisterService(&_RoomService_serviceDesc, srv)
}

func _RoomService_CreateRoom_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(CreateRoomRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(RoomServiceServer).CreateRoom(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/room.RoomService/CreateRoom",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(RoomServiceServer).CreateRoom(ctx, req.(*CreateRoomRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _RoomService_JoinRoom_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(JoinRoomRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(RoomServiceServer).JoinRoom(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/room.RoomService/JoinRoom",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(RoomServiceServer).JoinRoom(ctx, req.(*JoinRoomRequest))
	}
	return interceptor(ctx, in, info, handler)
}

var _RoomService_serviceDesc = grpc.ServiceDesc{
	ServiceName: "room.RoomService",
	HandlerType: (*RoomServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "CreateRoom",
			Handler:    _RoomService_CreateRoom_Handler,
		},
		{
			MethodName: "JoinRoom",
			Handler:    _RoomService_JoinRoom_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "room/room.proto",
}

func init() { proto.RegisterFile("room/room.proto", fileDescriptor_room_5eeb18644ef725f4) }

var fileDescriptor_room_5eeb18644ef725f4 = []byte{
	// 282 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xff, 0x74, 0x51, 0xc1, 0x4e, 0xc2, 0x40,
	0x10, 0x4d, 0x6b, 0xa9, 0x3a, 0x24, 0xa2, 0x6b, 0x94, 0x86, 0x8b, 0x75, 0x4f, 0x24, 0xc6, 0x92,
	0xe0, 0x45, 0x4f, 0x26, 0x72, 0xc2, 0x63, 0x0d, 0x67, 0x82, 0x74, 0xac, 0x6b, 0xda, 0x2e, 0xce,
	0xb6, 0xf2, 0x0d, 0xfe, 0xb5, 0x99, 0x2e, 0xd8, 0x06, 0xc2, 0xa5, 0x99, 0x99, 0xf7, 0xde, 0xbc,
	0x37, 0x5d, 0xe8, 0x91, 0xd6, 0xf9, 0x88, 0x3f, 0xd1, 0x8a, 0x74, 0xa9, 0x85, 0xc7, 0xb5, 0x7c,
	0x04, 0x2f, 0xd6, 0x3a, 0x17, 0x67, 0xe0, 0xaa, 0x24, 0x70, 0x42, 0x67, 0xd8, 0x89, 0x5d, 0x95,
	0x88, 0x10, 0x3a, 0x95, 0x41, 0x32, 0x81, 0x1b, 0x1e, 0x0d, 0xbb, 0x63, 0x88, 0x6a, 0xe5, 0xcc,
	0x20, 0xc5, 0x16, 0x90, 0x23, 0xf0, 0xb8, 0x6d, 0x29, 0x4f, 0x6b, 0x65, 0x1f, 0x8e, 0x55, 0x9e,
	0xce, 0x2b, 0xca, 0x02, 0xb7, 0x1e, 0xfa, 0x2a, 0x4f, 0x67, 0x94, 0xc9, 0x4b, 0xb8, 0x98, 0x10,
	0x2e, 0x4a, 0x64, 0xc3, 0x18, 0xbf, 0x2b, 0x34, 0xa5, 0xbc, 0x07, 0xd1, 0x1e, 0x9a, 0x95, 0x2e,
	0x0c, 0xf2, 0x0e, 0xf6, 0x9b, 0xff, 0x47, 0xf2, 0xb9, 0x9d, 0x26, 0x72, 0x02, 0xbd, 0x57, 0xad,
	0x8a, 0xd6, 0x86, 0x83, 0x5c, 0x06, 0x38, 0x29, 0x03, 0x9b, 0x20, 0xdc, 0x4e, 0x13, 0x79, 0x07,
	0xe7, 0xcd, 0x92, 0xc6, 0x71, 0x4b, 0x76, 0xda, 0xe4, 0xf1, 0xaf, 0x03, 0x5d, 0x66, 0xbe, 0x21,
	0xfd, 0xa8, 0x25, 0x8a, 0x67, 0x80, 0x26, 0xb0, 0xe8, 0xdb, 0xff, 0xb2, 0x77, 0xd7, 0x20, 0xd8,
	0x07, 0x36, 0x4e, 0x4f, 0x70, 0xb2, 0x75, 0x17, 0x57, 0x96, 0xb5, 0x73, 0xd2, 0xe0, 0x7a, 0x77,
	0x6c, 0xa5, 0x2f, 0xb7, 0x70, 0xf3, 0xa5, 0x16, 0x45, 0x1a, 0x19, 0xb5, 0xfc, 0xac, 0xa2, 0x35,
	0x12, 0xae, 0x75, 0xf6, 0x61, 0x1f, 0xb4, 0xd6, 0xbc, 0xfb, 0x75, 0xfd, 0xf0, 0x17, 0x00, 0x00,
	0xff, 0xff, 0x34, 0xfb, 0x3e, 0x68, 0xef, 0x01, 0x00, 0x00,
}
