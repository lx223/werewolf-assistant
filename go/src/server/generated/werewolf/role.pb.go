// Code generated by protoc-gen-go. DO NOT EDIT.
// source: werewolf/role.proto

package werewolf

import proto "github.com/golang/protobuf/proto"
import fmt "fmt"
import math "math"

// Reference imports to suppress errors if they are not otherwise used.
var _ = proto.Marshal
var _ = fmt.Errorf
var _ = math.Inf

// This is a compile-time assertion to ensure that this generated file
// is compatible with the proto package it is being compiled against.
// A compilation error at this line likely means your copy of the
// proto package needs to be updated.
const _ = proto.ProtoPackageIsVersion2 // please upgrade the proto package

type Role int32

const (
	Role_UNKNOWN  Role = 0
	Role_VILLAGER Role = 1
	Role_WEREWOLF Role = 2
	Role_WITCH    Role = 3
	Role_SEER     Role = 4
	Role_HUNTER   Role = 5
	Role_BLANK    Role = 6
)

var Role_name = map[int32]string{
	0: "UNKNOWN",
	1: "VILLAGER",
	2: "WEREWOLF",
	3: "WITCH",
	4: "SEER",
	5: "HUNTER",
	6: "BLANK",
}
var Role_value = map[string]int32{
	"UNKNOWN":  0,
	"VILLAGER": 1,
	"WEREWOLF": 2,
	"WITCH":    3,
	"SEER":     4,
	"HUNTER":   5,
	"BLANK":    6,
}

func (x Role) String() string {
	return proto.EnumName(Role_name, int32(x))
}
func (Role) EnumDescriptor() ([]byte, []int) {
	return fileDescriptor_role_9f124c28697bcc28, []int{0}
}

func init() {
	proto.RegisterEnum("werewolf.Role", Role_name, Role_value)
}

func init() { proto.RegisterFile("werewolf/role.proto", fileDescriptor_role_9f124c28697bcc28) }

var fileDescriptor_role_9f124c28697bcc28 = []byte{
	// 143 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xff, 0xe2, 0x12, 0x2e, 0x4f, 0x2d, 0x4a,
	0x2d, 0xcf, 0xcf, 0x49, 0xd3, 0x2f, 0xca, 0xcf, 0x49, 0xd5, 0x2b, 0x28, 0xca, 0x2f, 0xc9, 0x17,
	0xe2, 0x80, 0x09, 0x6a, 0x45, 0x73, 0xb1, 0x04, 0xe5, 0xe7, 0xa4, 0x0a, 0x71, 0x73, 0xb1, 0x87,
	0xfa, 0x79, 0xfb, 0xf9, 0x87, 0xfb, 0x09, 0x30, 0x08, 0xf1, 0x70, 0x71, 0x84, 0x79, 0xfa, 0xf8,
	0x38, 0xba, 0xbb, 0x06, 0x09, 0x30, 0x82, 0x78, 0xe1, 0xae, 0x41, 0xae, 0xe1, 0xfe, 0x3e, 0x6e,
	0x02, 0x4c, 0x42, 0x9c, 0x5c, 0xac, 0xe1, 0x9e, 0x21, 0xce, 0x1e, 0x02, 0xcc, 0x42, 0x1c, 0x5c,
	0x2c, 0xc1, 0xae, 0xae, 0x41, 0x02, 0x2c, 0x42, 0x5c, 0x5c, 0x6c, 0x1e, 0xa1, 0x7e, 0x21, 0xae,
	0x41, 0x02, 0xac, 0x20, 0x05, 0x4e, 0x3e, 0x8e, 0x7e, 0xde, 0x02, 0x6c, 0x49, 0x6c, 0x60, 0xdb,
	0x8c, 0x01, 0x01, 0x00, 0x00, 0xff, 0xff, 0xa4, 0x92, 0x1a, 0x34, 0x84, 0x00, 0x00, 0x00,
}