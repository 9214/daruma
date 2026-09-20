# Beyond Good & Evil Internet code encoder
#
# Registers:
#   edx  stat id
#   ecx  record index
#   eax  result
#
# Source:
#  GOG "Beyond Good and Evil" (gameId 1207658746), BGE.exe, 30 Jan 2004
#  7778304 bytes, sha256 fc8bd732acfdadc7c72070c85b9f8bb0811ead2cbb5dff842e993d96feb1993b
#
# Regenerate:
#   dd if=BGE.exe bs=1 skip=$((0x95e80)) count=$((0x8aa)) of=encoder.bin
#   objdump -D -b binary -m i386 -M intel --insn-width=10 --adjust-vma=0x495e80 encoder.bin

  495e80:	55                            	push   ebp
  495e81:	8b ec                         	mov    ebp,esp
  495e83:	81 ec c0 00 00 00             	sub    esp,0xc0
  495e89:	89 95 44 ff ff ff             	mov    DWORD PTR [ebp-0xbc],edx
  495e8f:	89 8d 48 ff ff ff             	mov    DWORD PTR [ebp-0xb8],ecx
  495e95:	83 bd 44 ff ff ff 64          	cmp    DWORD PTR [ebp-0xbc],0x64
  495e9c:	0f 8c 74 06 00 00             	jl     0x496516
  495ea2:	c7 85 58 ff ff ff 25 00 00 00 	mov    DWORD PTR [ebp-0xa8],0x25
  495eac:	c7 85 5c ff ff ff 1f 00 00 00 	mov    DWORD PTR [ebp-0xa4],0x1f
  495eb6:	c7 85 60 ff ff ff 1d 00 00 00 	mov    DWORD PTR [ebp-0xa0],0x1d
  495ec0:	c7 85 64 ff ff ff 17 00 00 00 	mov    DWORD PTR [ebp-0x9c],0x17
  495eca:	c7 85 68 ff ff ff 13 00 00 00 	mov    DWORD PTR [ebp-0x98],0x13
  495ed4:	c7 85 6c ff ff ff 11 00 00 00 	mov    DWORD PTR [ebp-0x94],0x11
  495ede:	c7 85 70 ff ff ff 0b 00 00 00 	mov    DWORD PTR [ebp-0x90],0xb
  495ee8:	c7 85 74 ff ff ff 07 00 00 00 	mov    DWORD PTR [ebp-0x8c],0x7
  495ef2:	83 bd 44 ff ff ff 73          	cmp    DWORD PTR [ebp-0xbc],0x73
  495ef9:	7e 07                         	jle    0x495f02
  495efb:	33 c0                         	xor    eax,eax
  495efd:	e9 24 08 00 00                	jmp    0x496726
  495f02:	8b 85 48 ff ff ff             	mov    eax,DWORD PTR [ebp-0xb8]
  495f08:	c1 e0 06                      	shl    eax,0x6
  495f0b:	8b 88 d4 52 d4 00             	mov    ecx,DWORD PTR [eax+0xd452d4]
  495f11:	81 e1 00 00 7e 00             	and    ecx,0x7e0000
  495f17:	c1 f9 11                      	sar    ecx,0x11
  495f1a:	89 4d 80                      	mov    DWORD PTR [ebp-0x80],ecx
  495f1d:	8b 95 48 ff ff ff             	mov    edx,DWORD PTR [ebp-0xb8]
  495f23:	c1 e2 06                      	shl    edx,0x6
  495f26:	8b 82 d4 52 d4 00             	mov    eax,DWORD PTR [edx+0xd452d4]
  495f2c:	25 00 00 01 00                	and    eax,0x10000
  495f31:	c1 f8 0b                      	sar    eax,0xb
  495f34:	89 45 84                      	mov    DWORD PTR [ebp-0x7c],eax
  495f37:	8b 8d 48 ff ff ff             	mov    ecx,DWORD PTR [ebp-0xb8]
  495f3d:	c1 e1 06                      	shl    ecx,0x6
  495f40:	8b 91 d4 52 d4 00             	mov    edx,DWORD PTR [ecx+0xd452d4]
  495f46:	83 e2 03                      	and    edx,0x3
  495f49:	c1 e2 03                      	shl    edx,0x3
  495f4c:	8b 45 84                      	mov    eax,DWORD PTR [ebp-0x7c]
  495f4f:	0b c2                         	or     eax,edx
  495f51:	89 45 84                      	mov    DWORD PTR [ebp-0x7c],eax
  495f54:	8b 8d 48 ff ff ff             	mov    ecx,DWORD PTR [ebp-0xb8]
  495f5a:	c1 e1 06                      	shl    ecx,0x6
  495f5d:	8b 91 d8 52 d4 00             	mov    edx,DWORD PTR [ecx+0xd452d8]
  495f63:	81 e2 00 00 00 07             	and    edx,0x7000000
  495f69:	c1 fa 18                      	sar    edx,0x18
  495f6c:	8b 45 84                      	mov    eax,DWORD PTR [ebp-0x7c]
  495f6f:	0b c2                         	or     eax,edx
  495f71:	89 45 84                      	mov    DWORD PTR [ebp-0x7c],eax
  495f74:	8b 8d 48 ff ff ff             	mov    ecx,DWORD PTR [ebp-0xb8]
  495f7a:	c1 e1 06                      	shl    ecx,0x6
  495f7d:	8b 91 d4 52 d4 00             	mov    edx,DWORD PTR [ecx+0xd452d4]
  495f83:	81 e2 00 3f 00 00             	and    edx,0x3f00
  495f89:	c1 fa 08                      	sar    edx,0x8
  495f8c:	89 55 88                      	mov    DWORD PTR [ebp-0x78],edx
  495f8f:	8b 85 48 ff ff ff             	mov    eax,DWORD PTR [ebp-0xb8]
  495f95:	c1 e0 06                      	shl    eax,0x6
  495f98:	8b 88 d8 52 d4 00             	mov    ecx,DWORD PTR [eax+0xd452d8]
  495f9e:	81 e1 00 00 fc 00             	and    ecx,0xfc0000
  495fa4:	c1 f9 12                      	sar    ecx,0x12
  495fa7:	89 4d 8c                      	mov    DWORD PTR [ebp-0x74],ecx
  495faa:	8b 95 48 ff ff ff             	mov    edx,DWORD PTR [ebp-0xb8]
  495fb0:	c1 e2 06                      	shl    edx,0x6
  495fb3:	8b 82 d8 52 d4 00             	mov    eax,DWORD PTR [edx+0xd452d8]
  495fb9:	25 00 f0 03 00                	and    eax,0x3f000
  495fbe:	c1 f8 0c                      	sar    eax,0xc
  495fc1:	89 45 90                      	mov    DWORD PTR [ebp-0x70],eax
  495fc4:	8b 8d 48 ff ff ff             	mov    ecx,DWORD PTR [ebp-0xb8]
  495fca:	c1 e1 06                      	shl    ecx,0x6
  495fcd:	8b 91 d8 52 d4 00             	mov    edx,DWORD PTR [ecx+0xd452d8]
  495fd3:	81 e2 c0 0f 00 00             	and    edx,0xfc0
  495fd9:	c1 fa 06                      	sar    edx,0x6
  495fdc:	89 55 94                      	mov    DWORD PTR [ebp-0x6c],edx
  495fdf:	8b 85 48 ff ff ff             	mov    eax,DWORD PTR [ebp-0xb8]
  495fe5:	c1 e0 06                      	shl    eax,0x6
  495fe8:	8b 88 d8 52 d4 00             	mov    ecx,DWORD PTR [eax+0xd452d8]
  495fee:	83 e1 3f                      	and    ecx,0x3f
  495ff1:	89 4d 98                      	mov    DWORD PTR [ebp-0x68],ecx
  495ff4:	8b 95 48 ff ff ff             	mov    edx,DWORD PTR [ebp-0xb8]
  495ffa:	c1 e2 06                      	shl    edx,0x6
  495ffd:	8b 82 f0 52 d4 00             	mov    eax,DWORD PTR [edx+0xd452f0]
  496003:	25 fc 00 00 00                	and    eax,0xfc
  496008:	c1 f8 02                      	sar    eax,0x2
  49600b:	89 45 9c                      	mov    DWORD PTR [ebp-0x64],eax
  49600e:	8b 8d 48 ff ff ff             	mov    ecx,DWORD PTR [ebp-0xb8]
  496014:	c1 e1 06                      	shl    ecx,0x6
  496017:	8b 91 f0 52 d4 00             	mov    edx,DWORD PTR [ecx+0xd452f0]
  49601d:	83 e2 03                      	and    edx,0x3
  496020:	c1 e2 04                      	shl    edx,0x4
  496023:	89 55 a0                      	mov    DWORD PTR [ebp-0x60],edx
  496026:	8b 85 48 ff ff ff             	mov    eax,DWORD PTR [ebp-0xb8]
  49602c:	c1 e0 06                      	shl    eax,0x6
  49602f:	8b 88 ec 52 d4 00             	mov    ecx,DWORD PTR [eax+0xd452ec]
  496035:	81 e1 00 00 00 1e             	and    ecx,0x1e000000
  49603b:	c1 f9 19                      	sar    ecx,0x19
  49603e:	8b 55 a0                      	mov    edx,DWORD PTR [ebp-0x60]
  496041:	0b d1                         	or     edx,ecx
  496043:	89 55 a0                      	mov    DWORD PTR [ebp-0x60],edx
  496046:	8b 85 48 ff ff ff             	mov    eax,DWORD PTR [ebp-0xb8]
  49604c:	c1 e0 06                      	shl    eax,0x6
  49604f:	8b 88 ec 52 d4 00             	mov    ecx,DWORD PTR [eax+0xd452ec]
  496055:	81 e1 00 00 00 01             	and    ecx,0x1000000
  49605b:	c1 f9 13                      	sar    ecx,0x13
  49605e:	89 4d a4                      	mov    DWORD PTR [ebp-0x5c],ecx
  496061:	8b 95 48 ff ff ff             	mov    edx,DWORD PTR [ebp-0xb8]
  496067:	c1 e2 06                      	shl    edx,0x6
  49606a:	8b 82 ec 52 d4 00             	mov    eax,DWORD PTR [edx+0xd452ec]
  496070:	25 00 1f 00 00                	and    eax,0x1f00
  496075:	c1 f8 08                      	sar    eax,0x8
  496078:	8b 4d a4                      	mov    ecx,DWORD PTR [ebp-0x5c]
  49607b:	0b c8                         	or     ecx,eax
  49607d:	89 4d a4                      	mov    DWORD PTR [ebp-0x5c],ecx
  496080:	8b 95 48 ff ff ff             	mov    edx,DWORD PTR [ebp-0xb8]
  496086:	c1 e2 06                      	shl    edx,0x6
  496089:	8b 82 ec 52 d4 00             	mov    eax,DWORD PTR [edx+0xd452ec]
  49608f:	25 00 00 1f 00                	and    eax,0x1f0000
  496094:	c1 f8 0e                      	sar    eax,0xe
  496097:	89 45 a8                      	mov    DWORD PTR [ebp-0x58],eax
  49609a:	8b 8d 48 ff ff ff             	mov    ecx,DWORD PTR [ebp-0xb8]
  4960a0:	c1 e1 06                      	shl    ecx,0x6
  4960a3:	8b 91 ec 52 d4 00             	mov    edx,DWORD PTR [ecx+0xd452ec]
  4960a9:	83 e2 0c                      	and    edx,0xc
  4960ac:	c1 fa 02                      	sar    edx,0x2
  4960af:	8b 45 a8                      	mov    eax,DWORD PTR [ebp-0x58]
  4960b2:	0b c2                         	or     eax,edx
  4960b4:	89 45 a8                      	mov    DWORD PTR [ebp-0x58],eax
  4960b7:	8b 8d 48 ff ff ff             	mov    ecx,DWORD PTR [ebp-0xb8]
  4960bd:	c1 e1 06                      	shl    ecx,0x6
  4960c0:	8b 91 ec 52 d4 00             	mov    edx,DWORD PTR [ecx+0xd452ec]
  4960c6:	83 e2 03                      	and    edx,0x3
  4960c9:	c1 e2 04                      	shl    edx,0x4
  4960cc:	89 55 ac                      	mov    DWORD PTR [ebp-0x54],edx
  4960cf:	8b 85 48 ff ff ff             	mov    eax,DWORD PTR [ebp-0xb8]
  4960d5:	c1 e0 06                      	shl    eax,0x6
  4960d8:	8b 80 d0 52 d4 00             	mov    eax,DWORD PTR [eax+0xd452d0]
  4960de:	99                            	cdq    
  4960df:	b9 3c 00 00 00                	mov    ecx,0x3c
  4960e4:	f7 f9                         	idiv   ecx
  4960e6:	89 55 bc                      	mov    DWORD PTR [ebp-0x44],edx
  4960e9:	8b 95 48 ff ff ff             	mov    edx,DWORD PTR [ebp-0xb8]
  4960ef:	c1 e2 06                      	shl    edx,0x6
  4960f2:	8b 82 d0 52 d4 00             	mov    eax,DWORD PTR [edx+0xd452d0]
  4960f8:	2b 45 bc                      	sub    eax,DWORD PTR [ebp-0x44]
  4960fb:	99                            	cdq    
  4960fc:	b9 3c 00 00 00                	mov    ecx,0x3c
  496101:	f7 f9                         	idiv   ecx
  496103:	89 45 fc                      	mov    DWORD PTR [ebp-0x4],eax
  496106:	8b 45 fc                      	mov    eax,DWORD PTR [ebp-0x4]
  496109:	99                            	cdq    
  49610a:	b9 3c 00 00 00                	mov    ecx,0x3c
  49610f:	f7 f9                         	idiv   ecx
  496111:	89 55 b4                      	mov    DWORD PTR [ebp-0x4c],edx
  496114:	8b 45 fc                      	mov    eax,DWORD PTR [ebp-0x4]
  496117:	2b 45 b4                      	sub    eax,DWORD PTR [ebp-0x4c]
  49611a:	99                            	cdq    
  49611b:	b9 3c 00 00 00                	mov    ecx,0x3c
  496120:	f7 f9                         	idiv   ecx
  496122:	89 45 b8                      	mov    DWORD PTR [ebp-0x48],eax
  496125:	83 7d b8 3f                   	cmp    DWORD PTR [ebp-0x48],0x3f
  496129:	7e 07                         	jle    0x496132
  49612b:	c7 45 b8 3f 00 00 00          	mov    DWORD PTR [ebp-0x48],0x3f
  496132:	8b 95 48 ff ff ff             	mov    edx,DWORD PTR [ebp-0xb8]
  496138:	c1 e2 06                      	shl    edx,0x6
  49613b:	8b 82 d4 52 d4 00             	mov    eax,DWORD PTR [edx+0xd452d4]
  496141:	89 45 fc                      	mov    DWORD PTR [ebp-0x4],eax
  496144:	8b 8d 48 ff ff ff             	mov    ecx,DWORD PTR [ebp-0xb8]
  49614a:	c1 e1 06                      	shl    ecx,0x6
  49614d:	8b 55 fc                      	mov    edx,DWORD PTR [ebp-0x4]
  496150:	03 91 d8 52 d4 00             	add    edx,DWORD PTR [ecx+0xd452d8]
  496156:	89 55 fc                      	mov    DWORD PTR [ebp-0x4],edx
  496159:	8b 85 48 ff ff ff             	mov    eax,DWORD PTR [ebp-0xb8]
  49615f:	c1 e0 06                      	shl    eax,0x6
  496162:	8b 4d fc                      	mov    ecx,DWORD PTR [ebp-0x4]
  496165:	03 88 ec 52 d4 00             	add    ecx,DWORD PTR [eax+0xd452ec]
  49616b:	89 4d fc                      	mov    DWORD PTR [ebp-0x4],ecx
  49616e:	8b 95 48 ff ff ff             	mov    edx,DWORD PTR [ebp-0xb8]
  496174:	c1 e2 06                      	shl    edx,0x6
  496177:	8b 45 fc                      	mov    eax,DWORD PTR [ebp-0x4]
  49617a:	03 82 f0 52 d4 00             	add    eax,DWORD PTR [edx+0xd452f0]
  496180:	89 45 fc                      	mov    DWORD PTR [ebp-0x4],eax
  496183:	8b 4d fc                      	mov    ecx,DWORD PTR [ebp-0x4]
  496186:	03 4d b4                      	add    ecx,DWORD PTR [ebp-0x4c]
  496189:	89 4d fc                      	mov    DWORD PTR [ebp-0x4],ecx
  49618c:	8b 55 fc                      	mov    edx,DWORD PTR [ebp-0x4]
  49618f:	03 55 b8                      	add    edx,DWORD PTR [ebp-0x48]
  496192:	89 55 fc                      	mov    DWORD PTR [ebp-0x4],edx
  496195:	8b 45 fc                      	mov    eax,DWORD PTR [ebp-0x4]
  496198:	03 45 bc                      	add    eax,DWORD PTR [ebp-0x44]
  49619b:	89 45 fc                      	mov    DWORD PTR [ebp-0x4],eax
  49619e:	8b 4d fc                      	mov    ecx,DWORD PTR [ebp-0x4]
  4961a1:	81 e1 00 00 c0 ff             	and    ecx,0xffc00000
  4961a7:	c1 e9 16                      	shr    ecx,0x16
  4961aa:	89 4d f8                      	mov    DWORD PTR [ebp-0x8],ecx
  4961ad:	8b 55 fc                      	mov    edx,DWORD PTR [ebp-0x4]
  4961b0:	81 e2 00 f0 3f 00             	and    edx,0x3ff000
  4961b6:	c1 fa 0c                      	sar    edx,0xc
  4961b9:	8b 45 f8                      	mov    eax,DWORD PTR [ebp-0x8]
  4961bc:	03 c2                         	add    eax,edx
  4961be:	89 45 f8                      	mov    DWORD PTR [ebp-0x8],eax
  4961c1:	8b 4d fc                      	mov    ecx,DWORD PTR [ebp-0x4]
  4961c4:	81 e1 fc 0f 00 00             	and    ecx,0xffc
  4961ca:	c1 f9 02                      	sar    ecx,0x2
  4961cd:	8b 55 f8                      	mov    edx,DWORD PTR [ebp-0x8]
  4961d0:	03 d1                         	add    edx,ecx
  4961d2:	89 55 f8                      	mov    DWORD PTR [ebp-0x8],edx
  4961d5:	8b 45 fc                      	mov    eax,DWORD PTR [ebp-0x4]
  4961d8:	83 e0 03                      	and    eax,0x3
  4961db:	8b 4d f8                      	mov    ecx,DWORD PTR [ebp-0x8]
  4961de:	03 c8                         	add    ecx,eax
  4961e0:	89 4d f8                      	mov    DWORD PTR [ebp-0x8],ecx
  4961e3:	8b 55 f8                      	mov    edx,DWORD PTR [ebp-0x8]
  4961e6:	81 e2 c0 03 00 00             	and    edx,0x3c0
  4961ec:	c1 fa 06                      	sar    edx,0x6
  4961ef:	8b 45 ac                      	mov    eax,DWORD PTR [ebp-0x54]
  4961f2:	0b c2                         	or     eax,edx
  4961f4:	89 45 ac                      	mov    DWORD PTR [ebp-0x54],eax
  4961f7:	8b 4d f8                      	mov    ecx,DWORD PTR [ebp-0x8]
  4961fa:	83 e1 3f                      	and    ecx,0x3f
  4961fd:	89 4d b0                      	mov    DWORD PTR [ebp-0x50],ecx
  496200:	8b 55 bc                      	mov    edx,DWORD PTR [ebp-0x44]
  496203:	83 e2 07                      	and    edx,0x7
  496206:	8b 84 95 58 ff ff ff          	mov    eax,DWORD PTR [ebp+edx*4-0xa8]
  49620d:	89 45 e4                      	mov    DWORD PTR [ebp-0x1c],eax
  496210:	c7 45 fc 00 00 00 00          	mov    DWORD PTR [ebp-0x4],0x0
  496217:	eb 09                         	jmp    0x496222
  496219:	8b 4d fc                      	mov    ecx,DWORD PTR [ebp-0x4]
  49621c:	83 c1 01                      	add    ecx,0x1
  49621f:	89 4d fc                      	mov    DWORD PTR [ebp-0x4],ecx
  496222:	83 7d fc 28                   	cmp    DWORD PTR [ebp-0x4],0x28
  496226:	0f 8d 8d 00 00 00             	jge    0x4962b9
  49622c:	8b 45 fc                      	mov    eax,DWORD PTR [ebp-0x4]
  49622f:	83 c0 01                      	add    eax,0x1
  496232:	0f af 45 e4                   	imul   eax,DWORD PTR [ebp-0x1c]
  496236:	99                            	cdq    
  496237:	b9 5a 00 00 00                	mov    ecx,0x5a
  49623c:	f7 f9                         	idiv   ecx
  49623e:	89 55 e8                      	mov    DWORD PTR [ebp-0x18],edx
  496241:	8b 45 e8                      	mov    eax,DWORD PTR [ebp-0x18]
  496244:	99                            	cdq    
  496245:	b9 06 00 00 00                	mov    ecx,0x6
  49624a:	f7 f9                         	idiv   ecx
  49624c:	89 55 f4                      	mov    DWORD PTR [ebp-0xc],edx
  49624f:	8b 45 e8                      	mov    eax,DWORD PTR [ebp-0x18]
  496252:	2b 45 f4                      	sub    eax,DWORD PTR [ebp-0xc]
  496255:	99                            	cdq    
  496256:	b9 06 00 00 00                	mov    ecx,0x6
  49625b:	f7 f9                         	idiv   ecx
  49625d:	89 45 f0                      	mov    DWORD PTR [ebp-0x10],eax
  496260:	8b 55 f0                      	mov    edx,DWORD PTR [ebp-0x10]
  496263:	8b 44 95 80                   	mov    eax,DWORD PTR [ebp+edx*4-0x80]
  496267:	8b 4d f4                      	mov    ecx,DWORD PTR [ebp-0xc]
  49626a:	d3 f8                         	sar    eax,cl
  49626c:	83 e0 01                      	and    eax,0x1
  49626f:	f7 d0                         	not    eax
  496271:	89 85 78 ff ff ff             	mov    DWORD PTR [ebp-0x88],eax
  496277:	ba 01 00 00 00                	mov    edx,0x1
  49627c:	8b 4d f4                      	mov    ecx,DWORD PTR [ebp-0xc]
  49627f:	d3 e2                         	shl    edx,cl
  496281:	f7 d2                         	not    edx
  496283:	8b 45 f0                      	mov    eax,DWORD PTR [ebp-0x10]
  496286:	8b 44 85 80                   	mov    eax,DWORD PTR [ebp+eax*4-0x80]
  49628a:	23 c2                         	and    eax,edx
  49628c:	8b 95 78 ff ff ff             	mov    edx,DWORD PTR [ebp-0x88]
  496292:	83 e2 01                      	and    edx,0x1
  496295:	8b 4d f4                      	mov    ecx,DWORD PTR [ebp-0xc]
  496298:	d3 e2                         	shl    edx,cl
  49629a:	0b c2                         	or     eax,edx
  49629c:	8b 4d f0                      	mov    ecx,DWORD PTR [ebp-0x10]
  49629f:	89 44 8d 80                   	mov    DWORD PTR [ebp+ecx*4-0x80],eax
  4962a3:	8b 55 f0                      	mov    edx,DWORD PTR [ebp-0x10]
  4962a6:	8b 44 95 80                   	mov    eax,DWORD PTR [ebp+edx*4-0x80]
  4962aa:	83 e0 3f                      	and    eax,0x3f
  4962ad:	8b 4d f0                      	mov    ecx,DWORD PTR [ebp-0x10]
  4962b0:	89 44 8d 80                   	mov    DWORD PTR [ebp+ecx*4-0x80],eax
  4962b4:	e9 60 ff ff ff                	jmp    0x496219
  4962b9:	8b 55 bc                      	mov    edx,DWORD PTR [ebp-0x44]
  4962bc:	c1 fa 03                      	sar    edx,0x3
  4962bf:	83 e2 07                      	and    edx,0x7
  4962c2:	89 55 e8                      	mov    DWORD PTR [ebp-0x18],edx
  4962c5:	8b 45 e8                      	mov    eax,DWORD PTR [ebp-0x18]
  4962c8:	8b 8c 85 58 ff ff ff          	mov    ecx,DWORD PTR [ebp+eax*4-0xa8]
  4962cf:	89 4d e4                      	mov    DWORD PTR [ebp-0x1c],ecx
  4962d2:	ba 07 00 00 00                	mov    edx,0x7
  4962d7:	2b 55 e8                      	sub    edx,DWORD PTR [ebp-0x18]
  4962da:	8b 84 95 58 ff ff ff          	mov    eax,DWORD PTR [ebp+edx*4-0xa8]
  4962e1:	89 45 ec                      	mov    DWORD PTR [ebp-0x14],eax
  4962e4:	c7 45 fc 00 00 00 00          	mov    DWORD PTR [ebp-0x4],0x0
  4962eb:	eb 09                         	jmp    0x4962f6
  4962ed:	8b 4d fc                      	mov    ecx,DWORD PTR [ebp-0x4]
  4962f0:	83 c1 01                      	add    ecx,0x1
  4962f3:	89 4d fc                      	mov    DWORD PTR [ebp-0x4],ecx
  4962f6:	83 7d fc 1e                   	cmp    DWORD PTR [ebp-0x4],0x1e
  4962fa:	0f 8d 17 01 00 00             	jge    0x496417
  496300:	8b 55 fc                      	mov    edx,DWORD PTR [ebp-0x4]
  496303:	83 c2 01                      	add    edx,0x1
  496306:	8b 45 e4                      	mov    eax,DWORD PTR [ebp-0x1c]
  496309:	0f af c2                      	imul   eax,edx
  49630c:	83 c0 2d                      	add    eax,0x2d
  49630f:	99                            	cdq    
  496310:	b9 5a 00 00 00                	mov    ecx,0x5a
  496315:	f7 f9                         	idiv   ecx
  496317:	89 55 e8                      	mov    DWORD PTR [ebp-0x18],edx
  49631a:	8b 45 e8                      	mov    eax,DWORD PTR [ebp-0x18]
  49631d:	99                            	cdq    
  49631e:	b9 06 00 00 00                	mov    ecx,0x6
  496323:	f7 f9                         	idiv   ecx
  496325:	89 55 f4                      	mov    DWORD PTR [ebp-0xc],edx
  496328:	8b 45 e8                      	mov    eax,DWORD PTR [ebp-0x18]
  49632b:	2b 45 f4                      	sub    eax,DWORD PTR [ebp-0xc]
  49632e:	99                            	cdq    
  49632f:	b9 06 00 00 00                	mov    ecx,0x6
  496334:	f7 f9                         	idiv   ecx
  496336:	89 45 f0                      	mov    DWORD PTR [ebp-0x10],eax
  496339:	8b 55 fc                      	mov    edx,DWORD PTR [ebp-0x4]
  49633c:	83 c2 01                      	add    edx,0x1
  49633f:	8b 45 ec                      	mov    eax,DWORD PTR [ebp-0x14]
  496342:	0f af c2                      	imul   eax,edx
  496345:	83 c0 2d                      	add    eax,0x2d
  496348:	99                            	cdq    
  496349:	b9 5a 00 00 00                	mov    ecx,0x5a
  49634e:	f7 f9                         	idiv   ecx
  496350:	89 95 50 ff ff ff             	mov    DWORD PTR [ebp-0xb0],edx
  496356:	8b 85 50 ff ff ff             	mov    eax,DWORD PTR [ebp-0xb0]
  49635c:	99                            	cdq    
  49635d:	b9 06 00 00 00                	mov    ecx,0x6
  496362:	f7 f9                         	idiv   ecx
  496364:	89 95 4c ff ff ff             	mov    DWORD PTR [ebp-0xb4],edx
  49636a:	8b 85 50 ff ff ff             	mov    eax,DWORD PTR [ebp-0xb0]
  496370:	2b 85 4c ff ff ff             	sub    eax,DWORD PTR [ebp-0xb4]
  496376:	99                            	cdq    
  496377:	b9 06 00 00 00                	mov    ecx,0x6
  49637c:	f7 f9                         	idiv   ecx
  49637e:	89 85 7c ff ff ff             	mov    DWORD PTR [ebp-0x84],eax
  496384:	8b 55 f0                      	mov    edx,DWORD PTR [ebp-0x10]
  496387:	8b 44 95 80                   	mov    eax,DWORD PTR [ebp+edx*4-0x80]
  49638b:	8b 4d f4                      	mov    ecx,DWORD PTR [ebp-0xc]
  49638e:	d3 f8                         	sar    eax,cl
  496390:	83 e0 01                      	and    eax,0x1
  496393:	89 85 78 ff ff ff             	mov    DWORD PTR [ebp-0x88],eax
  496399:	8b 8d 7c ff ff ff             	mov    ecx,DWORD PTR [ebp-0x84]
  49639f:	8b 54 8d 80                   	mov    edx,DWORD PTR [ebp+ecx*4-0x80]
  4963a3:	8b 8d 4c ff ff ff             	mov    ecx,DWORD PTR [ebp-0xb4]
  4963a9:	d3 fa                         	sar    edx,cl
  4963ab:	83 e2 01                      	and    edx,0x1
  4963ae:	89 95 54 ff ff ff             	mov    DWORD PTR [ebp-0xac],edx
  4963b4:	b8 01 00 00 00                	mov    eax,0x1
  4963b9:	8b 4d f4                      	mov    ecx,DWORD PTR [ebp-0xc]
  4963bc:	d3 e0                         	shl    eax,cl
  4963be:	f7 d0                         	not    eax
  4963c0:	8b 4d f0                      	mov    ecx,DWORD PTR [ebp-0x10]
  4963c3:	8b 54 8d 80                   	mov    edx,DWORD PTR [ebp+ecx*4-0x80]
  4963c7:	23 d0                         	and    edx,eax
  4963c9:	8b 85 54 ff ff ff             	mov    eax,DWORD PTR [ebp-0xac]
  4963cf:	8b 4d f4                      	mov    ecx,DWORD PTR [ebp-0xc]
  4963d2:	d3 e0                         	shl    eax,cl
  4963d4:	0b d0                         	or     edx,eax
  4963d6:	8b 4d f0                      	mov    ecx,DWORD PTR [ebp-0x10]
  4963d9:	89 54 8d 80                   	mov    DWORD PTR [ebp+ecx*4-0x80],edx
  4963dd:	ba 01 00 00 00                	mov    edx,0x1
  4963e2:	8b 8d 4c ff ff ff             	mov    ecx,DWORD PTR [ebp-0xb4]
  4963e8:	d3 e2                         	shl    edx,cl
  4963ea:	f7 d2                         	not    edx
  4963ec:	8b 85 7c ff ff ff             	mov    eax,DWORD PTR [ebp-0x84]
  4963f2:	8b 44 85 80                   	mov    eax,DWORD PTR [ebp+eax*4-0x80]
  4963f6:	23 c2                         	and    eax,edx
  4963f8:	8b 95 78 ff ff ff             	mov    edx,DWORD PTR [ebp-0x88]
  4963fe:	8b 8d 4c ff ff ff             	mov    ecx,DWORD PTR [ebp-0xb4]
  496404:	d3 e2                         	shl    edx,cl
  496406:	0b c2                         	or     eax,edx
  496408:	8b 8d 7c ff ff ff             	mov    ecx,DWORD PTR [ebp-0x84]
  49640e:	89 44 8d 80                   	mov    DWORD PTR [ebp+ecx*4-0x80],eax
  496412:	e9 d6 fe ff ff                	jmp    0x4962ed
  496417:	c7 45 fc 00 00 00 00          	mov    DWORD PTR [ebp-0x4],0x0
  49641e:	eb 09                         	jmp    0x496429
  496420:	8b 55 fc                      	mov    edx,DWORD PTR [ebp-0x4]
  496423:	83 c2 01                      	add    edx,0x1
  496426:	89 55 fc                      	mov    DWORD PTR [ebp-0x4],edx
  496429:	83 7d fc 06                   	cmp    DWORD PTR [ebp-0x4],0x6
  49642d:	0f 8d d1 00 00 00             	jge    0x496504
  496433:	8b 45 fc                      	mov    eax,DWORD PTR [ebp-0x4]
  496436:	83 c0 01                      	add    eax,0x1
  496439:	6b c0 0d                      	imul   eax,eax,0xd
  49643c:	89 45 e8                      	mov    DWORD PTR [ebp-0x18],eax
  49643f:	8b 45 e8                      	mov    eax,DWORD PTR [ebp-0x18]
  496442:	99                            	cdq    
  496443:	b9 06 00 00 00                	mov    ecx,0x6
  496448:	f7 f9                         	idiv   ecx
  49644a:	89 55 f4                      	mov    DWORD PTR [ebp-0xc],edx
  49644d:	8b 45 e8                      	mov    eax,DWORD PTR [ebp-0x18]
  496450:	2b 45 f4                      	sub    eax,DWORD PTR [ebp-0xc]
  496453:	99                            	cdq    
  496454:	b9 06 00 00 00                	mov    ecx,0x6
  496459:	f7 f9                         	idiv   ecx
  49645b:	89 45 f0                      	mov    DWORD PTR [ebp-0x10],eax
  49645e:	8b 55 fc                      	mov    edx,DWORD PTR [ebp-0x4]
  496461:	89 95 4c ff ff ff             	mov    DWORD PTR [ebp-0xb4],edx
  496467:	c7 85 7c ff ff ff 0f 00 00 00 	mov    DWORD PTR [ebp-0x84],0xf
  496471:	8b 45 f0                      	mov    eax,DWORD PTR [ebp-0x10]
  496474:	8b 54 85 80                   	mov    edx,DWORD PTR [ebp+eax*4-0x80]
  496478:	8b 4d f4                      	mov    ecx,DWORD PTR [ebp-0xc]
  49647b:	d3 fa                         	sar    edx,cl
  49647d:	83 e2 01                      	and    edx,0x1
  496480:	89 95 78 ff ff ff             	mov    DWORD PTR [ebp-0x88],edx
  496486:	8b 85 7c ff ff ff             	mov    eax,DWORD PTR [ebp-0x84]
  49648c:	8b 54 85 80                   	mov    edx,DWORD PTR [ebp+eax*4-0x80]
  496490:	8b 8d 4c ff ff ff             	mov    ecx,DWORD PTR [ebp-0xb4]
  496496:	d3 fa                         	sar    edx,cl
  496498:	83 e2 01                      	and    edx,0x1
  49649b:	89 95 54 ff ff ff             	mov    DWORD PTR [ebp-0xac],edx
  4964a1:	b8 01 00 00 00                	mov    eax,0x1
  4964a6:	8b 4d f4                      	mov    ecx,DWORD PTR [ebp-0xc]
  4964a9:	d3 e0                         	shl    eax,cl
  4964ab:	f7 d0                         	not    eax
  4964ad:	8b 4d f0                      	mov    ecx,DWORD PTR [ebp-0x10]
  4964b0:	8b 54 8d 80                   	mov    edx,DWORD PTR [ebp+ecx*4-0x80]
  4964b4:	23 d0                         	and    edx,eax
  4964b6:	8b 85 54 ff ff ff             	mov    eax,DWORD PTR [ebp-0xac]
  4964bc:	8b 4d f4                      	mov    ecx,DWORD PTR [ebp-0xc]
  4964bf:	d3 e0                         	shl    eax,cl
  4964c1:	0b d0                         	or     edx,eax
  4964c3:	8b 4d f0                      	mov    ecx,DWORD PTR [ebp-0x10]
  4964c6:	89 54 8d 80                   	mov    DWORD PTR [ebp+ecx*4-0x80],edx
  4964ca:	ba 01 00 00 00                	mov    edx,0x1
  4964cf:	8b 8d 4c ff ff ff             	mov    ecx,DWORD PTR [ebp-0xb4]
  4964d5:	d3 e2                         	shl    edx,cl
  4964d7:	f7 d2                         	not    edx
  4964d9:	8b 85 7c ff ff ff             	mov    eax,DWORD PTR [ebp-0x84]
  4964df:	8b 44 85 80                   	mov    eax,DWORD PTR [ebp+eax*4-0x80]
  4964e3:	23 c2                         	and    eax,edx
  4964e5:	8b 95 78 ff ff ff             	mov    edx,DWORD PTR [ebp-0x88]
  4964eb:	8b 8d 4c ff ff ff             	mov    ecx,DWORD PTR [ebp-0xb4]
  4964f1:	d3 e2                         	shl    edx,cl
  4964f3:	0b c2                         	or     eax,edx
  4964f5:	8b 8d 7c ff ff ff             	mov    ecx,DWORD PTR [ebp-0x84]
  4964fb:	89 44 8d 80                   	mov    DWORD PTR [ebp+ecx*4-0x80],eax
  4964ff:	e9 1c ff ff ff                	jmp    0x496420
  496504:	8b 95 44 ff ff ff             	mov    edx,DWORD PTR [ebp-0xbc]
  49650a:	8b 84 95 f0 fd ff ff          	mov    eax,DWORD PTR [ebp+edx*4-0x210]
  496511:	e9 10 02 00 00                	jmp    0x496726
  496516:	8b 85 44 ff ff ff             	mov    eax,DWORD PTR [ebp-0xbc]
  49651c:	89 85 40 ff ff ff             	mov    DWORD PTR [ebp-0xc0],eax
  496522:	83 bd 40 ff ff ff 1b          	cmp    DWORD PTR [ebp-0xc0],0x1b
  496529:	0f 87 f5 01 00 00             	ja     0x496724
  49652f:	8b 8d 40 ff ff ff             	mov    ecx,DWORD PTR [ebp-0xc0]
  496535:	ff 24 8d 2a 67 49 00          	jmp    DWORD PTR [ecx*4+0x49672a]
  49653c:	33 c9                         	xor    ecx,ecx
  49653e:	e8 fd f8 ff ff                	call   0x495e40
  496543:	33 c0                         	xor    eax,eax
  496545:	e9 dc 01 00 00                	jmp    0x496726
  49654a:	c7 45 f8 00 00 00 00          	mov    DWORD PTR [ebp-0x8],0x0
  496551:	c7 45 fc 00 00 00 00          	mov    DWORD PTR [ebp-0x4],0x0
  496558:	eb 09                         	jmp    0x496563
  49655a:	8b 55 fc                      	mov    edx,DWORD PTR [ebp-0x4]
  49655d:	83 c2 01                      	add    edx,0x1
  496560:	89 55 fc                      	mov    DWORD PTR [ebp-0x4],edx
  496563:	83 7d fc 0a                   	cmp    DWORD PTR [ebp-0x4],0xa
  496567:	7d 1c                         	jge    0x496585
  496569:	8b 45 fc                      	mov    eax,DWORD PTR [ebp-0x4]
  49656c:	c1 e0 06                      	shl    eax,0x6
  49656f:	0f be 88 c0 52 d4 00          	movsx  ecx,BYTE PTR [eax+0xd452c0]
  496576:	85 c9                         	test   ecx,ecx
  496578:	74 09                         	je     0x496583
  49657a:	8b 55 f8                      	mov    edx,DWORD PTR [ebp-0x8]
  49657d:	83 c2 01                      	add    edx,0x1
  496580:	89 55 f8                      	mov    DWORD PTR [ebp-0x8],edx
  496583:	eb d5                         	jmp    0x49655a
  496585:	8b 45 f8                      	mov    eax,DWORD PTR [ebp-0x8]
  496588:	e9 99 01 00 00                	jmp    0x496726
  49658d:	8b 85 48 ff ff ff             	mov    eax,DWORD PTR [ebp-0xb8]
  496593:	c1 e0 06                      	shl    eax,0x6
  496596:	0f be 80 c0 52 d4 00          	movsx  eax,BYTE PTR [eax+0xd452c0]
  49659d:	e9 84 01 00 00                	jmp    0x496726
  4965a2:	8b 8d 48 ff ff ff             	mov    ecx,DWORD PTR [ebp-0xb8]
  4965a8:	c1 e1 06                      	shl    ecx,0x6
  4965ab:	0f bf 81 c8 52 d4 00          	movsx  eax,WORD PTR [ecx+0xd452c8]
  4965b2:	e9 6f 01 00 00                	jmp    0x496726
  4965b7:	8b 95 48 ff ff ff             	mov    edx,DWORD PTR [ebp-0xb8]
  4965bd:	c1 e2 06                      	shl    edx,0x6
  4965c0:	0f bf 82 ca 52 d4 00          	movsx  eax,WORD PTR [edx+0xd452ca]
  4965c7:	e9 5a 01 00 00                	jmp    0x496726
  4965cc:	8b 85 48 ff ff ff             	mov    eax,DWORD PTR [ebp-0xb8]
  4965d2:	c1 e0 06                      	shl    eax,0x6
  4965d5:	0f be 80 c1 52 d4 00          	movsx  eax,BYTE PTR [eax+0xd452c1]
  4965dc:	e9 45 01 00 00                	jmp    0x496726
  4965e1:	8b 8d 48 ff ff ff             	mov    ecx,DWORD PTR [ebp-0xb8]
  4965e7:	c1 e1 06                      	shl    ecx,0x6
  4965ea:	0f be 81 c2 52 d4 00          	movsx  eax,BYTE PTR [ecx+0xd452c2]
  4965f1:	e9 30 01 00 00                	jmp    0x496726
  4965f6:	8b 95 48 ff ff ff             	mov    edx,DWORD PTR [ebp-0xb8]
  4965fc:	c1 e2 06                      	shl    edx,0x6
  4965ff:	0f be 82 c3 52 d4 00          	movsx  eax,BYTE PTR [edx+0xd452c3]
  496606:	e9 1b 01 00 00                	jmp    0x496726
  49660b:	8b 85 48 ff ff ff             	mov    eax,DWORD PTR [ebp-0xb8]
  496611:	c1 e0 06                      	shl    eax,0x6
  496614:	0f be 80 c4 52 d4 00          	movsx  eax,BYTE PTR [eax+0xd452c4]
  49661b:	e9 06 01 00 00                	jmp    0x496726
  496620:	8b 8d 48 ff ff ff             	mov    ecx,DWORD PTR [ebp-0xb8]
  496626:	c1 e1 06                      	shl    ecx,0x6
  496629:	0f be 81 c5 52 d4 00          	movsx  eax,BYTE PTR [ecx+0xd452c5]
  496630:	83 c0 01                      	add    eax,0x1
  496633:	e9 ee 00 00 00                	jmp    0x496726
  496638:	8b 95 48 ff ff ff             	mov    edx,DWORD PTR [ebp-0xb8]
  49663e:	c1 e2 06                      	shl    edx,0x6
  496641:	0f bf 82 c6 52 d4 00          	movsx  eax,WORD PTR [edx+0xd452c6]
  496648:	e9 d9 00 00 00                	jmp    0x496726
  49664d:	8b 85 48 ff ff ff             	mov    eax,DWORD PTR [ebp-0xb8]
  496653:	c1 e0 06                      	shl    eax,0x6
  496656:	0f bf 80 cc 52 d4 00          	movsx  eax,WORD PTR [eax+0xd452cc]
  49665d:	e9 c4 00 00 00                	jmp    0x496726
  496662:	8b 8d 48 ff ff ff             	mov    ecx,DWORD PTR [ebp-0xb8]
  496668:	c1 e1 06                      	shl    ecx,0x6
  49666b:	0f bf 81 ce 52 d4 00          	movsx  eax,WORD PTR [ecx+0xd452ce]
  496672:	e9 af 00 00 00                	jmp    0x496726
  496677:	8b 95 48 ff ff ff             	mov    edx,DWORD PTR [ebp-0xb8]
  49667d:	c1 e2 06                      	shl    edx,0x6
  496680:	8b 82 d0 52 d4 00             	mov    eax,DWORD PTR [edx+0xd452d0]
  496686:	e9 9b 00 00 00                	jmp    0x496726
  49668b:	b9 01 00 00 00                	mov    ecx,0x1
  496690:	e8 ab f7 ff ff                	call   0x495e40
  496695:	33 c0                         	xor    eax,eax
  496697:	e9 8a 00 00 00                	jmp    0x496726
  49669c:	8b 85 48 ff ff ff             	mov    eax,DWORD PTR [ebp-0xb8]
  4966a2:	c1 e0 06                      	shl    eax,0x6
  4966a5:	8b 80 d4 52 d4 00             	mov    eax,DWORD PTR [eax+0xd452d4]
  4966ab:	eb 79                         	jmp    0x496726
  4966ad:	8b 8d 48 ff ff ff             	mov    ecx,DWORD PTR [ebp-0xb8]
  4966b3:	c1 e1 06                      	shl    ecx,0x6
  4966b6:	8b 81 d8 52 d4 00             	mov    eax,DWORD PTR [ecx+0xd452d8]
  4966bc:	eb 68                         	jmp    0x496726
  4966be:	8b 95 48 ff ff ff             	mov    edx,DWORD PTR [ebp-0xb8]
  4966c4:	c1 e2 06                      	shl    edx,0x6
  4966c7:	8b 82 dc 52 d4 00             	mov    eax,DWORD PTR [edx+0xd452dc]
  4966cd:	eb 57                         	jmp    0x496726
  4966cf:	8b 85 48 ff ff ff             	mov    eax,DWORD PTR [ebp-0xb8]
  4966d5:	c1 e0 06                      	shl    eax,0x6
  4966d8:	8b 80 e0 52 d4 00             	mov    eax,DWORD PTR [eax+0xd452e0]
  4966de:	eb 46                         	jmp    0x496726
  4966e0:	8b 8d 48 ff ff ff             	mov    ecx,DWORD PTR [ebp-0xb8]
  4966e6:	c1 e1 06                      	shl    ecx,0x6
  4966e9:	8b 81 e4 52 d4 00             	mov    eax,DWORD PTR [ecx+0xd452e4]
  4966ef:	eb 35                         	jmp    0x496726
  4966f1:	8b 95 48 ff ff ff             	mov    edx,DWORD PTR [ebp-0xb8]
  4966f7:	c1 e2 06                      	shl    edx,0x6
  4966fa:	8b 82 e8 52 d4 00             	mov    eax,DWORD PTR [edx+0xd452e8]
  496700:	eb 24                         	jmp    0x496726
  496702:	8b 85 48 ff ff ff             	mov    eax,DWORD PTR [ebp-0xb8]
  496708:	c1 e0 06                      	shl    eax,0x6
  49670b:	8b 80 ec 52 d4 00             	mov    eax,DWORD PTR [eax+0xd452ec]
  496711:	eb 13                         	jmp    0x496726
  496713:	8b 8d 48 ff ff ff             	mov    ecx,DWORD PTR [ebp-0xb8]
  496719:	c1 e1 06                      	shl    ecx,0x6
  49671c:	8b 81 f0 52 d4 00             	mov    eax,DWORD PTR [ecx+0xd452f0]
  496722:	eb 02                         	jmp    0x496726
  496724:	33 c0                         	xor    eax,eax
  496726:	8b e5                         	mov    esp,ebp
  496728:	5d                            	pop    ebp
  496729:	c3                            	ret    
