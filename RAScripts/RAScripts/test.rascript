// ~Homebrew~ Luggage Retrieval Officer
// #ID = 23791

// $6488: [32-bit] Most recent stage entered; Story levels go from 0x01 to 0x32 and Arcade levels go from 0x33 to 0x226
CurrentLevel = dword(0x6488)
// $6494: [32-bit] Most recent Arcade stage entered; does not change if Story levels are played
// $6AC0: [8-bit] Displayed rank of currently selected Arcade level
//        0x00 - NA
//        0x01 - A+
//        0x02 - A
//        0x0a - D
// $6BF8: [8-bit] Current puzzle completion status
//        Bit0 - Puzzle marked complete and returns player to stage select
PuzzleComplete = bit0(0x6bf8)
// $6C08: [32-bit] Number of moves made in current/most recent puzzle
CurrentMoves = dword(0x6c08)
// $742C: another stage identifier, resets to ffffff on level select
// $7710: [32-bit] Total number of story levels complete
StoryComplete = dword(0x7710)
// $7714: [32-bit] Arcade - Best moves for Puzzle #1
// $7718: [32-bit] Arcade - Best moves for Puzzle #2
// $771C: [32-bit] Arcade - Best moves for Puzzle #3
// $7720: [32-bit] Arcade - Best moves for Puzzle #4
// $7724: [32-bit] Arcade - Best moves for Puzzle #5
// $7728: [32-bit] Arcade - Best moves for Puzzle #6
// $772C: [32-bit] Arcade - Best moves for Puzzle #7
// $7730: [32-bit] Arcade - Best moves for Puzzle #8
// $7734: [32-bit] Arcade - Best moves for Puzzle #9
// $7738: [32-bit] Arcade - Best moves for Puzzle #10
// $773C: [32-bit] Arcade - Best moves for Puzzle #11
// $7740: [32-bit] Arcade - Best moves for Puzzle #12
// $7744: [32-bit] Arcade - Best moves for Puzzle #13
// $7748: [32-bit] Arcade - Best moves for Puzzle #14
// $774C: [32-bit] Arcade - Best moves for Puzzle #15
// $7750: [32-bit] Arcade - Best moves for Puzzle #16
// $7754: [32-bit] Arcade - Best moves for Puzzle #17
// $7758: [32-bit] Arcade - Best moves for Puzzle #18
// $775C: [32-bit] Arcade - Best moves for Puzzle #19
// $7760: [32-bit] Arcade - Best moves for Puzzle #20
// $7764: [32-bit] Arcade - Best moves for Puzzle #21
// $7768: [32-bit] Arcade - Best moves for Puzzle #22
// $776C: [32-bit] Arcade - Best moves for Puzzle #23
// $7770: [32-bit] Arcade - Best moves for Puzzle #24
// $7774: [32-bit] Arcade - Best moves for Puzzle #25
// $7778: [32-bit] Arcade - Best moves for Puzzle #26
// $777C: [32-bit] Arcade - Best moves for Puzzle #27
// $7780: [32-bit] Arcade - Best moves for Puzzle #28
// $7784: [32-bit] Arcade - Best moves for Puzzle #29
// $7788: [32-bit] Arcade - Best moves for Puzzle #30
// $778C: [32-bit] Arcade - Best moves for Puzzle #31
// $7790: [32-bit] Arcade - Best moves for Puzzle #32
// $7794: [32-bit] Arcade - Best moves for Puzzle #33
// $7798: [32-bit] Arcade - Best moves for Puzzle #34
// $779C: [32-bit] Arcade - Best moves for Puzzle #35
// $77A0: [32-bit] Arcade - Best moves for Puzzle #36
// $77A4: [32-bit] Arcade - Best moves for Puzzle #37
// $77A8: [32-bit] Arcade - Best moves for Puzzle #38
// $77AC: [32-bit] Arcade - Best moves for Puzzle #39
// $77B0: [32-bit] Arcade - Best moves for Puzzle #40
// $77B4: [32-bit] Arcade - Best moves for Puzzle #41
// $77B8: [32-bit] Arcade - Best moves for Puzzle #42
// $77BC: [32-bit] Arcade - Best moves for Puzzle #43
// $77C0: [32-bit] Arcade - Best moves for Puzzle #44
// $77C4: [32-bit] Arcade - Best moves for Puzzle #45
// $77C8: [32-bit] Arcade - Best moves for Puzzle #46
// $77CC: [32-bit] Arcade - Best moves for Puzzle #47
// $77D0: [32-bit] Arcade - Best moves for Puzzle #48
// $77D4: [32-bit] Arcade - Best moves for Puzzle #49
// $77D8: [32-bit] Arcade - Best moves for Puzzle #50
// $77DC: [32-bit] Arcade - Best moves for Puzzle #51
// $77E0: [32-bit] Arcade - Best moves for Puzzle #52
// $77E4: [32-bit] Arcade - Best moves for Puzzle #53
// $77E8: [32-bit] Arcade - Best moves for Puzzle #54
// $77EC: [32-bit] Arcade - Best moves for Puzzle #55
// $77F0: [32-bit] Arcade - Best moves for Puzzle #56
// $77F4: [32-bit] Arcade - Best moves for Puzzle #57
// $77F8: [32-bit] Arcade - Best moves for Puzzle #58
// $77FC: [32-bit] Arcade - Best moves for Puzzle #59
// $7800: [32-bit] Arcade - Best moves for Puzzle #60
// $7804: [32-bit] Arcade - Best moves for Puzzle #61
// $7808: [32-bit] Arcade - Best moves for Puzzle #62
// $780C: [32-bit] Arcade - Best moves for Puzzle #63
// $7810: [32-bit] Arcade - Best moves for Puzzle #64
// $7814: [32-bit] Arcade - Best moves for Puzzle #65
// $7818: [32-bit] Arcade - Best moves for Puzzle #66
// $781C: [32-bit] Arcade - Best moves for Puzzle #67
// $7820: [32-bit] Arcade - Best moves for Puzzle #68
// $7824: [32-bit] Arcade - Best moves for Puzzle #69
// $7828: [32-bit] Arcade - Best moves for Puzzle #70
// $782C: [32-bit] Arcade - Best moves for Puzzle #71
// $7830: [32-bit] Arcade - Best moves for Puzzle #72
// $7834: [32-bit] Arcade - Best moves for Puzzle #73
// $7838: [32-bit] Arcade - Best moves for Puzzle #74
// $783C: [32-bit] Arcade - Best moves for Puzzle #75
// $7840: [32-bit] Arcade - Best moves for Puzzle #76
// $7844: [32-bit] Arcade - Best moves for Puzzle #77
// $7848: [32-bit] Arcade - Best moves for Puzzle #78
// $784C: [32-bit] Arcade - Best moves for Puzzle #79
// $7850: [32-bit] Arcade - Best moves for Puzzle #80
// $7854: [32-bit] Arcade - Best moves for Puzzle #81
// $7858: [32-bit] Arcade - Best moves for Puzzle #82
// $785C: [32-bit] Arcade - Best moves for Puzzle #83
// $7860: [32-bit] Arcade - Best moves for Puzzle #84
// $7864: [32-bit] Arcade - Best moves for Puzzle #85
// $7868: [32-bit] Arcade - Best moves for Puzzle #86
// $786C: [32-bit] Arcade - Best moves for Puzzle #87
// $7870: [32-bit] Arcade - Best moves for Puzzle #88
// $7874: [32-bit] Arcade - Best moves for Puzzle #89
// $7878: [32-bit] Arcade - Best moves for Puzzle #90
// $787C: [32-bit] Arcade - Best moves for Puzzle #91
// $7880: [32-bit] Arcade - Best moves for Puzzle #92
// $7884: [32-bit] Arcade - Best moves for Puzzle #93
// $7888: [32-bit] Arcade - Best moves for Puzzle #94
// $788C: [32-bit] Arcade - Best moves for Puzzle #95
// $7890: [32-bit] Arcade - Best moves for Puzzle #96
// $7894: [32-bit] Arcade - Best moves for Puzzle #97
// $7898: [32-bit] Arcade - Best moves for Puzzle #98
// $789C: [32-bit] Arcade - Best moves for Puzzle #99
// $78A0: [32-bit] Arcade - Best moves for Puzzle #100
// $78A4: [32-bit] Arcade - Best moves for Puzzle #101
// $78A8: [32-bit] Arcade - Best moves for Puzzle #102
// $78AC: [32-bit] Arcade - Best moves for Puzzle #103
// $78B0: [32-bit] Arcade - Best moves for Puzzle #104
// $78B4: [32-bit] Arcade - Best moves for Puzzle #105
// $78B8: [32-bit] Arcade - Best moves for Puzzle #106
// $78BC: [32-bit] Arcade - Best moves for Puzzle #107
// $78C0: [32-bit] Arcade - Best moves for Puzzle #108
// $78C4: [32-bit] Arcade - Best moves for Puzzle #109
// $78C8: [32-bit] Arcade - Best moves for Puzzle #110
// $78CC: [32-bit] Arcade - Best moves for Puzzle #111
// $78D0: [32-bit] Arcade - Best moves for Puzzle #112
// $78D4: [32-bit] Arcade - Best moves for Puzzle #113
// $78D8: [32-bit] Arcade - Best moves for Puzzle #114
// $78DC: [32-bit] Arcade - Best moves for Puzzle #115
// $78E0: [32-bit] Arcade - Best moves for Puzzle #116
// $78E4: [32-bit] Arcade - Best moves for Puzzle #117
// $78E8: [32-bit] Arcade - Best moves for Puzzle #118
// $78EC: [32-bit] Arcade - Best moves for Puzzle #119
// $78F0: [32-bit] Arcade - Best moves for Puzzle #120
// $78F4: [32-bit] Arcade - Best moves for Puzzle #121
// $78F8: [32-bit] Arcade - Best moves for Puzzle #122
// $78FC: [32-bit] Arcade - Best moves for Puzzle #123
// $7900: [32-bit] Arcade - Best moves for Puzzle #124
// $7904: [32-bit] Arcade - Best moves for Puzzle #125
// $7908: [32-bit] Arcade - Best moves for Puzzle #126
// $790C: [32-bit] Arcade - Best moves for Puzzle #127
// $7910: [32-bit] Arcade - Best moves for Puzzle #128
// $7914: [32-bit] Arcade - Best moves for Puzzle #129
// $7918: [32-bit] Arcade - Best moves for Puzzle #130
// $791C: [32-bit] Arcade - Best moves for Puzzle #131
// $7920: [32-bit] Arcade - Best moves for Puzzle #132
// $7924: [32-bit] Arcade - Best moves for Puzzle #133
// $7928: [32-bit] Arcade - Best moves for Puzzle #134
// $792C: [32-bit] Arcade - Best moves for Puzzle #135
// $7930: [32-bit] Arcade - Best moves for Puzzle #136
// $7934: [32-bit] Arcade - Best moves for Puzzle #137
// $7938: [32-bit] Arcade - Best moves for Puzzle #138
// $793C: [32-bit] Arcade - Best moves for Puzzle #139
// $7940: [32-bit] Arcade - Best moves for Puzzle #140
// $7944: [32-bit] Arcade - Best moves for Puzzle #141
// $7948: [32-bit] Arcade - Best moves for Puzzle #142
// $794C: [32-bit] Arcade - Best moves for Puzzle #143
// $7950: [32-bit] Arcade - Best moves for Puzzle #144
// $7954: [32-bit] Arcade - Best moves for Puzzle #145
// $7958: [32-bit] Arcade - Best moves for Puzzle #146
// $795C: [32-bit] Arcade - Best moves for Puzzle #147
// $7960: [32-bit] Arcade - Best moves for Puzzle #148
// $7964: [32-bit] Arcade - Best moves for Puzzle #149
// $7968: [32-bit] Arcade - Best moves for Puzzle #150
// $796C: [32-bit] Arcade - Best moves for Puzzle #151
// $7970: [32-bit] Arcade - Best moves for Puzzle #152
// $7974: [32-bit] Arcade - Best moves for Puzzle #153
// $7978: [32-bit] Arcade - Best moves for Puzzle #154
// $797C: [32-bit] Arcade - Best moves for Puzzle #155
// $7980: [32-bit] Arcade - Best moves for Puzzle #156
// $7984: [32-bit] Arcade - Best moves for Puzzle #157
// $7988: [32-bit] Arcade - Best moves for Puzzle #158
// $798C: [32-bit] Arcade - Best moves for Puzzle #159
// $7990: [32-bit] Arcade - Best moves for Puzzle #160
// $7994: [32-bit] Arcade - Best moves for Puzzle #161
// $7998: [32-bit] Arcade - Best moves for Puzzle #162
// $799C: [32-bit] Arcade - Best moves for Puzzle #163
// $79A0: [32-bit] Arcade - Best moves for Puzzle #164
// $79A4: [32-bit] Arcade - Best moves for Puzzle #165
// $79A8: [32-bit] Arcade - Best moves for Puzzle #166
// $79AC: [32-bit] Arcade - Best moves for Puzzle #167
// $79B0: [32-bit] Arcade - Best moves for Puzzle #168
// $79B4: [32-bit] Arcade - Best moves for Puzzle #169
// $79B8: [32-bit] Arcade - Best moves for Puzzle #170
// $79BC: [32-bit] Arcade - Best moves for Puzzle #171
// $79C0: [32-bit] Arcade - Best moves for Puzzle #172
// $79C4: [32-bit] Arcade - Best moves for Puzzle #173
// $79C8: [32-bit] Arcade - Best moves for Puzzle #174
// $79CC: [32-bit] Arcade - Best moves for Puzzle #175
// $79D0: [32-bit] Arcade - Best moves for Puzzle #176
// $79D4: [32-bit] Arcade - Best moves for Puzzle #177
// $79D8: [32-bit] Arcade - Best moves for Puzzle #178
// $79DC: [32-bit] Arcade - Best moves for Puzzle #179
// $79E0: [32-bit] Arcade - Best moves for Puzzle #180
// $79E4: [32-bit] Arcade - Best moves for Puzzle #181
// $79E8: [32-bit] Arcade - Best moves for Puzzle #182
// $79EC: [32-bit] Arcade - Best moves for Puzzle #183
// $79F0: [32-bit] Arcade - Best moves for Puzzle #184
// $79F4: [32-bit] Arcade - Best moves for Puzzle #185
// $79F8: [32-bit] Arcade - Best moves for Puzzle #186
// $79FC: [32-bit] Arcade - Best moves for Puzzle #187
// $7A00: [32-bit] Arcade - Best moves for Puzzle #188
// $7A04: [32-bit] Arcade - Best moves for Puzzle #189
// $7A08: [32-bit] Arcade - Best moves for Puzzle #190
// $7A0C: [32-bit] Arcade - Best moves for Puzzle #191
// $7A10: [32-bit] Arcade - Best moves for Puzzle #192
// $7A14: [32-bit] Arcade - Best moves for Puzzle #193
// $7A18: [32-bit] Arcade - Best moves for Puzzle #194
// $7A1C: [32-bit] Arcade - Best moves for Puzzle #195
// $7A20: [32-bit] Arcade - Best moves for Puzzle #196
// $7A24: [32-bit] Arcade - Best moves for Puzzle #197
// $7A28: [32-bit] Arcade - Best moves for Puzzle #198
// $7A2C: [32-bit] Arcade - Best moves for Puzzle #199
// $7A30: [32-bit] Arcade - Best moves for Puzzle #200
// $7A34: [32-bit] Arcade - Best moves for Puzzle #201
// $7A38: [32-bit] Arcade - Best moves for Puzzle #202
// $7A3C: [32-bit] Arcade - Best moves for Puzzle #203
// $7A40: [32-bit] Arcade - Best moves for Puzzle #204
// $7A44: [32-bit] Arcade - Best moves for Puzzle #205
// $7A48: [32-bit] Arcade - Best moves for Puzzle #206
// $7A4C: [32-bit] Arcade - Best moves for Puzzle #207
// $7A50: [32-bit] Arcade - Best moves for Puzzle #208
// $7A54: [32-bit] Arcade - Best moves for Puzzle #209
// $7A58: [32-bit] Arcade - Best moves for Puzzle #210
// $7A5C: [32-bit] Arcade - Best moves for Puzzle #211
// $7A60: [32-bit] Arcade - Best moves for Puzzle #212
// $7A64: [32-bit] Arcade - Best moves for Puzzle #213
// $7A68: [32-bit] Arcade - Best moves for Puzzle #214
// $7A6C: [32-bit] Arcade - Best moves for Puzzle #215
// $7A70: [32-bit] Arcade - Best moves for Puzzle #216
// $7A74: [32-bit] Arcade - Best moves for Puzzle #217
// $7A78: [32-bit] Arcade - Best moves for Puzzle #218
// $7A7C: [32-bit] Arcade - Best moves for Puzzle #219
// $7A80: [32-bit] Arcade - Best moves for Puzzle #220
// $7A84: [32-bit] Arcade - Best moves for Puzzle #221
// $7A88: [32-bit] Arcade - Best moves for Puzzle #222
// $7A8C: [32-bit] Arcade - Best moves for Puzzle #223
// $7A90: [32-bit] Arcade - Best moves for Puzzle #224
// $7A94: [32-bit] Arcade - Best moves for Puzzle #225
// $7A98: [32-bit] Arcade - Best moves for Puzzle #226
// $7A9C: [32-bit] Arcade - Best moves for Puzzle #227
// $7AA0: [32-bit] Arcade - Best moves for Puzzle #228
// $7AA4: [32-bit] Arcade - Best moves for Puzzle #229
// $7AA8: [32-bit] Arcade - Best moves for Puzzle #230
// $7AAC: [32-bit] Arcade - Best moves for Puzzle #231
// $7AB0: [32-bit] Arcade - Best moves for Puzzle #232
// $7AB4: [32-bit] Arcade - Best moves for Puzzle #233
// $7AB8: [32-bit] Arcade - Best moves for Puzzle #234
// $7ABC: [32-bit] Arcade - Best moves for Puzzle #235
// $7AC0: [32-bit] Arcade - Best moves for Puzzle #236
// $7AC4: [32-bit] Arcade - Best moves for Puzzle #237
// $7AC8: [32-bit] Arcade - Best moves for Puzzle #238
// $7ACC: [32-bit] Arcade - Best moves for Puzzle #239
// $7AD0: [32-bit] Arcade - Best moves for Puzzle #240
// $7AD4: [32-bit] Arcade - Best moves for Puzzle #241
// $7AD8: [32-bit] Arcade - Best moves for Puzzle #242
// $7ADC: [32-bit] Arcade - Best moves for Puzzle #243
// $7AE0: [32-bit] Arcade - Best moves for Puzzle #244
// $7AE4: [32-bit] Arcade - Best moves for Puzzle #245
// $7AE8: [32-bit] Arcade - Best moves for Puzzle #246
// $7AEC: [32-bit] Arcade - Best moves for Puzzle #247
// $7AF0: [32-bit] Arcade - Best moves for Puzzle #248
// $7AF4: [32-bit] Arcade - Best moves for Puzzle #249
// $7AF8: [32-bit] Arcade - Best moves for Puzzle #250
// $7AFC: [32-bit] Arcade - Best moves for Puzzle #251
// $7B00: [32-bit] Arcade - Best moves for Puzzle #252
// $7B04: [32-bit] Arcade - Best moves for Puzzle #253
// $7B08: [32-bit] Arcade - Best moves for Puzzle #254
// $7B0C: [32-bit] Arcade - Best moves for Puzzle #255
// $7B10: [32-bit] Arcade - Best moves for Puzzle #256
// $7B14: [32-bit] Arcade - Best moves for Puzzle #257
// $7B18: [32-bit] Arcade - Best moves for Puzzle #258
// $7B1C: [32-bit] Arcade - Best moves for Puzzle #259
// $7B20: [32-bit] Arcade - Best moves for Puzzle #260
// $7B24: [32-bit] Arcade - Best moves for Puzzle #261
// $7B28: [32-bit] Arcade - Best moves for Puzzle #262
// $7B2C: [32-bit] Arcade - Best moves for Puzzle #263
// $7B30: [32-bit] Arcade - Best moves for Puzzle #264
// $7B34: [32-bit] Arcade - Best moves for Puzzle #265
// $7B38: [32-bit] Arcade - Best moves for Puzzle #266
// $7B3C: [32-bit] Arcade - Best moves for Puzzle #267
// $7B40: [32-bit] Arcade - Best moves for Puzzle #268
// $7B44: [32-bit] Arcade - Best moves for Puzzle #269
// $7B48: [32-bit] Arcade - Best moves for Puzzle #270
// $7B4C: [32-bit] Arcade - Best moves for Puzzle #271
// $7B50: [32-bit] Arcade - Best moves for Puzzle #272
// $7B54: [32-bit] Arcade - Best moves for Puzzle #273
// $7B58: [32-bit] Arcade - Best moves for Puzzle #274
// $7B5C: [32-bit] Arcade - Best moves for Puzzle #275
// $7B60: [32-bit] Arcade - Best moves for Puzzle #276
// $7B64: [32-bit] Arcade - Best moves for Puzzle #277
// $7B68: [32-bit] Arcade - Best moves for Puzzle #278
// $7B6C: [32-bit] Arcade - Best moves for Puzzle #279
// $7B70: [32-bit] Arcade - Best moves for Puzzle #280
// $7B74: [32-bit] Arcade - Best moves for Puzzle #281
// $7B78: [32-bit] Arcade - Best moves for Puzzle #282
// $7B7C: [32-bit] Arcade - Best moves for Puzzle #283
// $7B80: [32-bit] Arcade - Best moves for Puzzle #284
// $7B84: [32-bit] Arcade - Best moves for Puzzle #285
// $7B88: [32-bit] Arcade - Best moves for Puzzle #286
// $7B8C: [32-bit] Arcade - Best moves for Puzzle #287
// $7B90: [32-bit] Arcade - Best moves for Puzzle #288
// $7B94: [32-bit] Arcade - Best moves for Puzzle #289
// $7B98: [32-bit] Arcade - Best moves for Puzzle #290
// $7B9C: [32-bit] Arcade - Best moves for Puzzle #291
// $7BA0: [32-bit] Arcade - Best moves for Puzzle #292
// $7BA4: [32-bit] Arcade - Best moves for Puzzle #293
// $7BA8: [32-bit] Arcade - Best moves for Puzzle #294
// $7BAC: [32-bit] Arcade - Best moves for Puzzle #295
// $7BB0: [32-bit] Arcade - Best moves for Puzzle #296
// $7BB4: [32-bit] Arcade - Best moves for Puzzle #297
// $7BB8: [32-bit] Arcade - Best moves for Puzzle #298
// $7BBC: [32-bit] Arcade - Best moves for Puzzle #299
// $7BC0: [32-bit] Arcade - Best moves for Puzzle #300
// $7BC4: [32-bit] Arcade - Best moves for Puzzle #301
// $7BC8: [32-bit] Arcade - Best moves for Puzzle #302
// $7BCC: [32-bit] Arcade - Best moves for Puzzle #303
// $7BD0: [32-bit] Arcade - Best moves for Puzzle #304
// $7BD4: [32-bit] Arcade - Best moves for Puzzle #305
// $7BD8: [32-bit] Arcade - Best moves for Puzzle #306
// $7BDC: [32-bit] Arcade - Best moves for Puzzle #307
// $7BE0: [32-bit] Arcade - Best moves for Puzzle #308
// $7BE4: [32-bit] Arcade - Best moves for Puzzle #309
// $7BE8: [32-bit] Arcade - Best moves for Puzzle #310
// $7BEC: [32-bit] Arcade - Best moves for Puzzle #311
// $7BF0: [32-bit] Arcade - Best moves for Puzzle #312
// $7BF4: [32-bit] Arcade - Best moves for Puzzle #313
// $7BF8: [32-bit] Arcade - Best moves for Puzzle #314
// $7BFC: [32-bit] Arcade - Best moves for Puzzle #315
// $7C00: [32-bit] Arcade - Best moves for Puzzle #316
// $7C04: [32-bit] Arcade - Best moves for Puzzle #317
// $7C08: [32-bit] Arcade - Best moves for Puzzle #318
// $7C0C: [32-bit] Arcade - Best moves for Puzzle #319
// $7C10: [32-bit] Arcade - Best moves for Puzzle #320
// $7C14: [32-bit] Arcade - Best moves for Puzzle #321
// $7C18: [32-bit] Arcade - Best moves for Puzzle #322
// $7C1C: [32-bit] Arcade - Best moves for Puzzle #323
// $7C20: [32-bit] Arcade - Best moves for Puzzle #324
// $7C24: [32-bit] Arcade - Best moves for Puzzle #325
// $7C28: [32-bit] Arcade - Best moves for Puzzle #326
// $7C2C: [32-bit] Arcade - Best moves for Puzzle #327
// $7C30: [32-bit] Arcade - Best moves for Puzzle #328
// $7C34: [32-bit] Arcade - Best moves for Puzzle #329
// $7C38: [32-bit] Arcade - Best moves for Puzzle #330
// $7C3C: [32-bit] Arcade - Best moves for Puzzle #331
// $7C40: [32-bit] Arcade - Best moves for Puzzle #332
// $7C44: [32-bit] Arcade - Best moves for Puzzle #333
// $7C48: [32-bit] Arcade - Best moves for Puzzle #334
// $7C4C: [32-bit] Arcade - Best moves for Puzzle #335
// $7C50: [32-bit] Arcade - Best moves for Puzzle #336
// $7C54: [32-bit] Arcade - Best moves for Puzzle #337
// $7C58: [32-bit] Arcade - Best moves for Puzzle #338
// $7C5C: [32-bit] Arcade - Best moves for Puzzle #339
// $7C60: [32-bit] Arcade - Best moves for Puzzle #340
// $7C64: [32-bit] Arcade - Best moves for Puzzle #341
// $7C68: [32-bit] Arcade - Best moves for Puzzle #342
// $7C6C: [32-bit] Arcade - Best moves for Puzzle #343
// $7C70: [32-bit] Arcade - Best moves for Puzzle #344
// $7C74: [32-bit] Arcade - Best moves for Puzzle #345
// $7C78: [32-bit] Arcade - Best moves for Puzzle #346
// $7C7C: [32-bit] Arcade - Best moves for Puzzle #347
// $7C80: [32-bit] Arcade - Best moves for Puzzle #348
// $7C84: [32-bit] Arcade - Best moves for Puzzle #349
// $7C88: [32-bit] Arcade - Best moves for Puzzle #350
// $7C8C: [32-bit] Arcade - Best moves for Puzzle #351
// $7C90: [32-bit] Arcade - Best moves for Puzzle #352
// $7C94: [32-bit] Arcade - Best moves for Puzzle #353
// $7C98: [32-bit] Arcade - Best moves for Puzzle #354
// $7C9C: [32-bit] Arcade - Best moves for Puzzle #355
// $7CA0: [32-bit] Arcade - Best moves for Puzzle #356
// $7CA4: [32-bit] Arcade - Best moves for Puzzle #357
// $7CA8: [32-bit] Arcade - Best moves for Puzzle #358
// $7CAC: [32-bit] Arcade - Best moves for Puzzle #359
// $7CB0: [32-bit] Arcade - Best moves for Puzzle #360
// $7CB4: [32-bit] Arcade - Best moves for Puzzle #361
// $7CB8: [32-bit] Arcade - Best moves for Puzzle #362
// $7CBC: [32-bit] Arcade - Best moves for Puzzle #363
// $7CC0: [32-bit] Arcade - Best moves for Puzzle #364
// $7CC4: [32-bit] Arcade - Best moves for Puzzle #365
// $7CC8: [32-bit] Arcade - Best moves for Puzzle #366
// $7CCC: [32-bit] Arcade - Best moves for Puzzle #367
// $7CD0: [32-bit] Arcade - Best moves for Puzzle #368
// $7CD4: [32-bit] Arcade - Best moves for Puzzle #369
// $7CD8: [32-bit] Arcade - Best moves for Puzzle #370
// $7CDC: [32-bit] Arcade - Best moves for Puzzle #371
// $7CE0: [32-bit] Arcade - Best moves for Puzzle #372
// $7CE4: [32-bit] Arcade - Best moves for Puzzle #373
// $7CE8: [32-bit] Arcade - Best moves for Puzzle #374
// $7CEC: [32-bit] Arcade - Best moves for Puzzle #375
// $7CF0: [32-bit] Arcade - Best moves for Puzzle #376
// $7CF4: [32-bit] Arcade - Best moves for Puzzle #377
// $7CF8: [32-bit] Arcade - Best moves for Puzzle #378
// $7CFC: [32-bit] Arcade - Best moves for Puzzle #379
// $7D00: [32-bit] Arcade - Best moves for Puzzle #380
// $7D04: [32-bit] Arcade - Best moves for Puzzle #381
// $7D08: [32-bit] Arcade - Best moves for Puzzle #382
// $7D0C: [32-bit] Arcade - Best moves for Puzzle #383
// $7D10: [32-bit] Arcade - Best moves for Puzzle #384
// $7D14: [32-bit] Arcade - Best moves for Puzzle #385
// $7D18: [32-bit] Arcade - Best moves for Puzzle #386
// $7D1C: [32-bit] Arcade - Best moves for Puzzle #387
// $7D20: [32-bit] Arcade - Best moves for Puzzle #388
// $7D24: [32-bit] Arcade - Best moves for Puzzle #389
// $7D28: [32-bit] Arcade - Best moves for Puzzle #390
// $7D2C: [32-bit] Arcade - Best moves for Puzzle #391
// $7D30: [32-bit] Arcade - Best moves for Puzzle #392
// $7D34: [32-bit] Arcade - Best moves for Puzzle #393
// $7D38: [32-bit] Arcade - Best moves for Puzzle #394
// $7D3C: [32-bit] Arcade - Best moves for Puzzle #395
// $7D40: [32-bit] Arcade - Best moves for Puzzle #396
// $7D44: [32-bit] Arcade - Best moves for Puzzle #397
// $7D48: [32-bit] Arcade - Best moves for Puzzle #398
// $7D4C: [32-bit] Arcade - Best moves for Puzzle #399
// $7D50: [32-bit] Arcade - Best moves for Puzzle #400
// $7D54: [32-bit] Arcade - Best moves for Puzzle #401
// $7D58: [32-bit] Arcade - Best moves for Puzzle #402
// $7D5C: [32-bit] Arcade - Best moves for Puzzle #403
// $7D60: [32-bit] Arcade - Best moves for Puzzle #404
// $7D64: [32-bit] Arcade - Best moves for Puzzle #405
// $7D68: [32-bit] Arcade - Best moves for Puzzle #406
// $7D6C: [32-bit] Arcade - Best moves for Puzzle #407
// $7D70: [32-bit] Arcade - Best moves for Puzzle #408
// $7D74: [32-bit] Arcade - Best moves for Puzzle #409
// $7D78: [32-bit] Arcade - Best moves for Puzzle #410
// $7D7C: [32-bit] Arcade - Best moves for Puzzle #411
// $7D80: [32-bit] Arcade - Best moves for Puzzle #412
// $7D84: [32-bit] Arcade - Best moves for Puzzle #413
// $7D88: [32-bit] Arcade - Best moves for Puzzle #414
// $7D8C: [32-bit] Arcade - Best moves for Puzzle #415
// $7D90: [32-bit] Arcade - Best moves for Puzzle #416
// $7D94: [32-bit] Arcade - Best moves for Puzzle #417
// $7D98: [32-bit] Arcade - Best moves for Puzzle #418
// $7D9C: [32-bit] Arcade - Best moves for Puzzle #419
// $7DA0: [32-bit] Arcade - Best moves for Puzzle #420
// $7DA4: [32-bit] Arcade - Best moves for Puzzle #421
// $7DA8: [32-bit] Arcade - Best moves for Puzzle #422
// $7DAC: [32-bit] Arcade - Best moves for Puzzle #423
// $7DB0: [32-bit] Arcade - Best moves for Puzzle #424
// $7DB4: [32-bit] Arcade - Best moves for Puzzle #425
// $7DB8: [32-bit] Arcade - Best moves for Puzzle #426
// $7DBC: [32-bit] Arcade - Best moves for Puzzle #427
// $7DC0: [32-bit] Arcade - Best moves for Puzzle #428
// $7DC4: [32-bit] Arcade - Best moves for Puzzle #429
// $7DC8: [32-bit] Arcade - Best moves for Puzzle #430
// $7DCC: [32-bit] Arcade - Best moves for Puzzle #431
// $7DD0: [32-bit] Arcade - Best moves for Puzzle #432
// $7DD4: [32-bit] Arcade - Best moves for Puzzle #433
// $7DD8: [32-bit] Arcade - Best moves for Puzzle #434
// $7DDC: [32-bit] Arcade - Best moves for Puzzle #435
// $7DE0: [32-bit] Arcade - Best moves for Puzzle #436
// $7DE4: [32-bit] Arcade - Best moves for Puzzle #437
// $7DE8: [32-bit] Arcade - Best moves for Puzzle #438
// $7DEC: [32-bit] Arcade - Best moves for Puzzle #439
// $7DF0: [32-bit] Arcade - Best moves for Puzzle #440
// $7DF4: [32-bit] Arcade - Best moves for Puzzle #441
// $7DF8: [32-bit] Arcade - Best moves for Puzzle #442
// $7DFC: [32-bit] Arcade - Best moves for Puzzle #443
// $7E00: [32-bit] Arcade - Best moves for Puzzle #444
// $7E04: [32-bit] Arcade - Best moves for Puzzle #445
// $7E08: [32-bit] Arcade - Best moves for Puzzle #446
// $7E0C: [32-bit] Arcade - Best moves for Puzzle #447
// $7E10: [32-bit] Arcade - Best moves for Puzzle #448
// $7E14: [32-bit] Arcade - Best moves for Puzzle #449
// $7E18: [32-bit] Arcade - Best moves for Puzzle #450
// $7E1C: [32-bit] Arcade - Best moves for Puzzle #451
// $7E20: [32-bit] Arcade - Best moves for Puzzle #452
// $7E24: [32-bit] Arcade - Best moves for Puzzle #453
// $7E28: [32-bit] Arcade - Best moves for Puzzle #454
// $7E2C: [32-bit] Arcade - Best moves for Puzzle #455
// $7E30: [32-bit] Arcade - Best moves for Puzzle #456
// $7E34: [32-bit] Arcade - Best moves for Puzzle #457
// $7E38: [32-bit] Arcade - Best moves for Puzzle #458
// $7E3C: [32-bit] Arcade - Best moves for Puzzle #459
// $7E40: [32-bit] Arcade - Best moves for Puzzle #460
// $7E44: [32-bit] Arcade - Best moves for Puzzle #461
// $7E48: [32-bit] Arcade - Best moves for Puzzle #462
// $7E4C: [32-bit] Arcade - Best moves for Puzzle #463
// $7E50: [32-bit] Arcade - Best moves for Puzzle #464
// $7E54: [32-bit] Arcade - Best moves for Puzzle #465
// $7E58: [32-bit] Arcade - Best moves for Puzzle #466
// $7E5C: [32-bit] Arcade - Best moves for Puzzle #467
// $7E60: [32-bit] Arcade - Best moves for Puzzle #468
// $7E64: [32-bit] Arcade - Best moves for Puzzle #469
// $7E68: [32-bit] Arcade - Best moves for Puzzle #470
// $7E6C: [32-bit] Arcade - Best moves for Puzzle #471
// $7E70: [32-bit] Arcade - Best moves for Puzzle #472
// $7E74: [32-bit] Arcade - Best moves for Puzzle #473
// $7E78: [32-bit] Arcade - Best moves for Puzzle #474
// $7E7C: [32-bit] Arcade - Best moves for Puzzle #475
// $7E80: [32-bit] Arcade - Best moves for Puzzle #476
// $7E84: [32-bit] Arcade - Best moves for Puzzle #477
// $7E88: [32-bit] Arcade - Best moves for Puzzle #478
// $7E8C: [32-bit] Arcade - Best moves for Puzzle #479
// $7E90: [32-bit] Arcade - Best moves for Puzzle #480
// $7E94: [32-bit] Arcade - Best moves for Puzzle #481
// $7E98: [32-bit] Arcade - Best moves for Puzzle #482
// $7E9C: [32-bit] Arcade - Best moves for Puzzle #483
// $7EA0: [32-bit] Arcade - Best moves for Puzzle #484
// $7EA4: [32-bit] Arcade - Best moves for Puzzle #485
// $7EA8: [32-bit] Arcade - Best moves for Puzzle #486
// $7EAC: [32-bit] Arcade - Best moves for Puzzle #487
// $7EB0: [32-bit] Arcade - Best moves for Puzzle #488
// $7EB4: [32-bit] Arcade - Best moves for Puzzle #489
// $7EB8: [32-bit] Arcade - Best moves for Puzzle #490
// $7EBC: [32-bit] Arcade - Best moves for Puzzle #491
// $7EC0: [32-bit] Arcade - Best moves for Puzzle #492
// $7EC4: [32-bit] Arcade - Best moves for Puzzle #493
// $7EC8: [32-bit] Arcade - Best moves for Puzzle #494
// $7ECC: [32-bit] Arcade - Best moves for Puzzle #495
// $7ED0: [32-bit] Arcade - Best moves for Puzzle #496
// $7ED4: [32-bit] Arcade - Best moves for Puzzle #497
// $7ED8: [32-bit] Arcade - Best moves for Puzzle #498
// $7EDC: [32-bit] Arcade - Best moves for Puzzle #499
// $7EE0: [32-bit] Arcade - Best moves for Puzzle #500
// $7EE4: [8-bit] Alt Art option; turning this on makes the target luggage be striped
//        0x00 - Off
//        0x01 - On
AltArt = byte(0x7ee4)
// $A630: [8-bit] Game status
//        0x00 - Loading / Help
//        0x01 - Story scene
//        0x02 - Loading puzzle
//        0x03 - In puzzle
//        0x06 - Title screen
//        0x07 - Arcade menu
//        0x0a - Main menu
//        0x0b - Story - Level select
//        0x0e - Story - Select Rank screen
GameStatus = byte(0xa630)

ArcadeAchTitle = {
    10:"Arcade Trainee I",
    20:"Arcade Trainee II",
    30:"Arcade Trainee III",
    40:"Arcade Trainee IV",
    50:"Arcade Trainee V",
    60:"Arcade Trainee VI",
    70:"Arcade Trainee VII",
    80:"Arcade Trainee VIII",
    90:"Arcade Trainee IX",
    100:"Arcade Trainee X",
    110:"Arcade Recruit I",
    120:"Arcade Recruit II",
    130:"Arcade Recruit III",
    140:"Arcade Recruit IV",
    150:"Arcade Recruit V",
    160:"Arcade Recruit VI",
    170:"Arcade Recruit VII",
    180:"Arcade Recruit VIII",
    190:"Arcade Recruit IX",
    200:"Arcade Recruit X",
    210:"Arcade Senior I",
    220:"Arcade Senior II",
    230:"Arcade Senior III",
    240:"Arcade Senior IV",
    250:"Arcade Senior V",
    260:"Arcade Senior VI",
    270:"Arcade Senior VII",
    280:"Arcade Senior VIII",
    290:"Arcade Senior IX",
    300:"Arcade Senior X",
    310:"Arcade Expert I",
    320:"Arcade Expert II",
    330:"Arcade Expert III",
    340:"Arcade Expert IV",
    350:"Arcade Expert V",
    360:"Arcade Expert VI",
    370:"Arcade Expert VII",
    380:"Arcade Expert VIII",
    390:"Arcade Expert IX",
    400:"Arcade Expert X",
    410:"Arcade Officer I",
    420:"Arcade Officer II",
    430:"Arcade Officer III",
    440:"Arcade Officer IV",
    450:"Arcade Officer V",
    460:"Arcade Officer VI",
    470:"Arcade Officer VII",
    480:"Arcade Officer VIII",
    490:"Arcade Officer IX",
    500:"Arcade Officer X"
}

ArcadePerfectTitle = {
    10:"Skilled Arcade Trainee I",
    20:"Skilled Arcade Trainee II",
    30:"Skilled Arcade Trainee III",
    40:"Skilled Arcade Trainee IV",
    50:"Skilled Arcade Trainee V",
    60:"Skilled Arcade Trainee VI",
    70:"Skilled Arcade Trainee VII",
    80:"Skilled Arcade Trainee VIII",
    90:"Skilled Arcade Trainee IX",
    100:"Skilled Arcade Trainee X",
    110:"Skilled Arcade Recruit I",
    120:"Skilled Arcade Recruit II",
    130:"Skilled Arcade Recruit III",
    140:"Skilled Arcade Recruit IV",
    150:"Skilled Arcade Recruit V",
    160:"Skilled Arcade Recruit VI",
    170:"Skilled Arcade Recruit VII",
    180:"Skilled Arcade Recruit VIII",
    190:"Skilled Arcade Recruit IX",
    200:"Skilled Arcade Recruit X",
    210:"Skilled Arcade Senior I",
    220:"Skilled Arcade Senior II",
    230:"Skilled Arcade Senior III",
    240:"Skilled Arcade Senior IV",
    250:"Skilled Arcade Senior V",
    260:"Skilled Arcade Senior VI",
    270:"Skilled Arcade Senior VII",
    280:"Skilled Arcade Senior VIII",
    290:"Skilled Arcade Senior IX",
    300:"Skilled Arcade Senior X",
    310:"Skilled Arcade Expert I",
    320:"Skilled Arcade Expert II",
    330:"Skilled Arcade Expert III",
    340:"Skilled Arcade Expert IV",
    350:"Skilled Arcade Expert V",
    360:"Skilled Arcade Expert VI",
    370:"Skilled Arcade Expert VII",
    380:"Skilled Arcade Expert VIII",
    390:"Skilled Arcade Expert IX",
    400:"Skilled Arcade Expert X",
    410:"Skilled Arcade Officer I",
    420:"Skilled Arcade Officer II",
    430:"Skilled Arcade Officer III",
    440:"Skilled Arcade Officer IV",
    450:"Skilled Arcade Officer V",
    460:"Skilled Arcade Officer VI",
    470:"Skilled Arcade Officer VII",
    480:"Skilled Arcade Officer VIII",
    490:"Skilled Arcade Officer IX",
    500:"Skilled Arcade Officer X"
}

//Player "rank" by story progress for RP
RankLookup = {
    0: "Trainee",
    1: "Trainee",
    2: "Trainee",
    3: "Trainee",
    4: "Trainee",
    5: "Trainee",
    6: "Trainee",
    7: "Trainee",
    8: "Trainee",
    9: "Trainee",
    10: "Recruit",
    11: "Recruit",
    12: "Recruit",
    13: "Recruit",
    14: "Recruit",
    15: "Recruit",
    16: "Recruit",
    17: "Recruit",
    18: "Recruit",
    19: "Recruit",
    20: "Senior",
    21: "Senior",
    22: "Senior",
    23: "Senior",
    24: "Senior",
    25: "Senior",
    26: "Senior",
    27: "Senior",
    28: "Senior",
    29: "Senior",
    30: "Expert",
    31: "Expert",
    32: "Expert",
    33: "Expert",
    34: "Expert",
    35: "Expert",
    36: "Expert",
    37: "Expert",
    38: "Expert",
    39: "Expert",
    40: "Officer",
    41: "Officer",
    42: "Officer",
    43: "Officer",
    44: "Officer",
    45: "Officer",
    46: "Officer",
    47: "Officer",
    48: "Officer",
    49: "Officer",
    50: "Officer",
}

//Target moves for each arcade level
ArcadeTarget = {
    0x7714: 30,
    0x7718: 30,
    0x771C: 31,
    0x7720: 30,
    0x7724: 31,
    0x7728: 30,
    0x772C: 32,
    0x7730: 31,
    0x7734: 32,
    0x7738: 29,
    0x773C: 33,
    0x7740: 30,
    0x7744: 31,
    0x7748: 29,
    0x774C: 30,
    0x7750: 29,
    0x7754: 32,
    0x7758: 33,
    0x775C: 30,
    0x7760: 29,
    0x7764: 29,
    0x7768: 34,
    0x776C: 36,
    0x7770: 31,
    0x7774: 31,
    0x7778: 30,
    0x777C: 30,
    0x7780: 29,
    0x7784: 38,
    0x7788: 33,
    0x778C: 29,
    0x7790: 29,
    0x7794: 40,
    0x7798: 32,
    0x779C: 31,
    0x77A0: 32,
    0x77A4: 33,
    0x77A8: 33,
    0x77AC: 32,
    0x77B0: 32,
    0x77B4: 32,
    0x77B8: 33,
    0x77BC: 31,
    0x77C0: 29,
    0x77C4: 29,
    0x77C8: 45,
    0x77CC: 29,
    0x77D0: 33,
    0x77D4: 29,
    0x77D8: 29,
    0x77DC: 30,
    0x77E0: 38,
    0x77E4: 30,
    0x77E8: 38,
    0x77EC: 29,
    0x77F0: 31,
    0x77F4: 36,
    0x77F8: 32,
    0x77FC: 32,
    0x7800: 36,
    0x7804: 29,
    0x7808: 29,
    0x780C: 29,
    0x7810: 29,
    0x7814: 36,
    0x7818: 44,
    0x781C: 32,
    0x7820: 49,
    0x7824: 30,
    0x7828: 30,
    0x782C: 29,
    0x7830: 29,
    0x7834: 32,
    0x7838: 31,
    0x783C: 39,
    0x7840: 31,
    0x7844: 29,
    0x7848: 31,
    0x784C: 29,
    0x7850: 29,
    0x7854: 30,
    0x7858: 31,
    0x785C: 31,
    0x7860: 35,
    0x7864: 31,
    0x7868: 35,
    0x786C: 44,
    0x7870: 42,
    0x7874: 31,
    0x7878: 29,
    0x787C: 32,
    0x7880: 44,
    0x7884: 36,
    0x7888: 29,
    0x788C: 29,
    0x7890: 29,
    0x7894: 31,
    0x7898: 31,
    0x789C: 35,
    0x78A0: 29,
    0x78A4: 31,
    0x78A8: 29,
    0x78AC: 29,
    0x78B0: 29,
    0x78B4: 32,
    0x78B8: 29,
    0x78BC: 29,
    0x78C0: 29,
    0x78C4: 35,
    0x78C8: 30,
    0x78CC: 33,
    0x78D0: 30,
    0x78D4: 29,
    0x78D8: 31,
    0x78DC: 31,
    0x78E0: 29,
    0x78E4: 30,
    0x78E8: 41,
    0x78EC: 34,
    0x78F0: 36,
    0x78F4: 35,
    0x78F8: 30,
    0x78FC: 33,
    0x7900: 31,
    0x7904: 31,
    0x7908: 30,
    0x790C: 45,
    0x7910: 36,
    0x7914: 31,
    0x7918: 29,
    0x791C: 31,
    0x7920: 29,
    0x7924: 29,
    0x7928: 29,
    0x792C: 33,
    0x7930: 32,
    0x7934: 34,
    0x7938: 30,
    0x793C: 35,
    0x7940: 29,
    0x7944: 30,
    0x7948: 35,
    0x794C: 29,
    0x7950: 36,
    0x7954: 30,
    0x7958: 29,
    0x795C: 29,
    0x7960: 29,
    0x7964: 36,
    0x7968: 29,
    0x796C: 37,
    0x7970: 34,
    0x7974: 31,
    0x7978: 29,
    0x797C: 35,
    0x7980: 35,
    0x7984: 30,
    0x7988: 29,
    0x798C: 35,
    0x7990: 44,
    0x7994: 35,
    0x7998: 29,
    0x799C: 30,
    0x79A0: 29,
    0x79A4: 36,
    0x79A8: 35,
    0x79AC: 29,
    0x79B0: 33,
    0x79B4: 34,
    0x79B8: 34,
    0x79BC: 29,
    0x79C0: 29,
    0x79C4: 31,
    0x79C8: 30,
    0x79CC: 34,
    0x79D0: 32,
    0x79D4: 29,
    0x79D8: 30,
    0x79DC: 33,
    0x79E0: 33,
    0x79E4: 29,
    0x79E8: 31,
    0x79EC: 30,
    0x79F0: 31,
    0x79F4: 31,
    0x79F8: 30,
    0x79FC: 29,
    0x7A00: 45,
    0x7A04: 41,
    0x7A08: 38,
    0x7A0C: 29,
    0x7A10: 33,
    0x7A14: 30,
    0x7A18: 31,
    0x7A1C: 29,
    0x7A20: 29,
    0x7A24: 30,
    0x7A28: 43,
    0x7A2C: 32,
    0x7A30: 32,
    0x7A34: 35,
    0x7A38: 35,
    0x7A3C: 35,
    0x7A40: 30,
    0x7A44: 36,
    0x7A48: 29,
    0x7A4C: 35,
    0x7A50: 32,
    0x7A54: 32,
    0x7A58: 30,
    0x7A5C: 29,
    0x7A60: 29,
    0x7A64: 29,
    0x7A68: 33,
    0x7A6C: 29,
    0x7A70: 31,
    0x7A74: 32,
    0x7A78: 31,
    0x7A7C: 29,
    0x7A80: 31,
    0x7A84: 29,
    0x7A88: 31,
    0x7A8C: 29,
    0x7A90: 41,
    0x7A94: 30,
    0x7A98: 30,
    0x7A9C: 35,
    0x7AA0: 31,
    0x7AA4: 33,
    0x7AA8: 36,
    0x7AAC: 31,
    0x7AB0: 37,
    0x7AB4: 35,
    0x7AB8: 32,
    0x7ABC: 33,
    0x7AC0: 31,
    0x7AC4: 33,
    0x7AC8: 32,
    0x7ACC: 30,
    0x7AD0: 34,
    0x7AD4: 34,
    0x7AD8: 41,
    0x7ADC: 31,
    0x7AE0: 31,
    0x7AE4: 30,
    0x7AE8: 29,
    0x7AEC: 33,
    0x7AF0: 29,
    0x7AF4: 37,
    0x7AF8: 30,
    0x7AFC: 29,
    0x7B00: 38,
    0x7B04: 29,
    0x7B08: 30,
    0x7B0C: 29,
    0x7B10: 32,
    0x7B14: 34,
    0x7B18: 29,
    0x7B1C: 29,
    0x7B20: 31,
    0x7B24: 31,
    0x7B28: 29,
    0x7B2C: 31,
    0x7B30: 30,
    0x7B34: 31,
    0x7B38: 29,
    0x7B3C: 29,
    0x7B40: 31,
    0x7B44: 37,
    0x7B48: 38,
    0x7B4C: 35,
    0x7B50: 29,
    0x7B54: 33,
    0x7B58: 32,
    0x7B5C: 31,
    0x7B60: 29,
    0x7B64: 30,
    0x7B68: 36,
    0x7B6C: 29,
    0x7B70: 29,
    0x7B74: 29,
    0x7B78: 30,
    0x7B7C: 29,
    0x7B80: 29,
    0x7B84: 29,
    0x7B88: 29,
    0x7B8C: 30,
    0x7B90: 38,
    0x7B94: 30,
    0x7B98: 29,
    0x7B9C: 32,
    0x7BA0: 31,
    0x7BA4: 29,
    0x7BA8: 39,
    0x7BAC: 32,
    0x7BB0: 35,
    0x7BB4: 29,
    0x7BB8: 29,
    0x7BBC: 29,
    0x7BC0: 39,
    0x7BC4: 29,
    0x7BC8: 29,
    0x7BCC: 31,
    0x7BD0: 36,
    0x7BD4: 39,
    0x7BD8: 32,
    0x7BDC: 31,
    0x7BE0: 35,
    0x7BE4: 29,
    0x7BE8: 30,
    0x7BEC: 38,
    0x7BF0: 35,
    0x7BF4: 30,
    0x7BF8: 30,
    0x7BFC: 30,
    0x7C00: 29,
    0x7C04: 30,
    0x7C08: 30,
    0x7C0C: 29,
    0x7C10: 29,
    0x7C14: 29,
    0x7C18: 35,
    0x7C1C: 29,
    0x7C20: 29,
    0x7C24: 37,
    0x7C28: 35,
    0x7C2C: 33,
    0x7C30: 29,
    0x7C34: 30,
    0x7C38: 29,
    0x7C3C: 35,
    0x7C40: 37,
    0x7C44: 29,
    0x7C48: 31,
    0x7C4C: 31,
    0x7C50: 29,
    0x7C54: 38,
    0x7C58: 30,
    0x7C5C: 33,
    0x7C60: 31,
    0x7C64: 29,
    0x7C68: 31,
    0x7C6C: 32,
    0x7C70: 37,
    0x7C74: 31,
    0x7C78: 33,
    0x7C7C: 41,
    0x7C80: 31,
    0x7C84: 29,
    0x7C88: 30,
    0x7C8C: 38,
    0x7C90: 29,
    0x7C94: 33,
    0x7C98: 29,
    0x7C9C: 31,
    0x7CA0: 30,
    0x7CA4: 29,
    0x7CA8: 29,
    0x7CAC: 32,
    0x7CB0: 31,
    0x7CB4: 32,
    0x7CB8: 29,
    0x7CBC: 33,
    0x7CC0: 38,
    0x7CC4: 29,
    0x7CC8: 29,
    0x7CCC: 34,
    0x7CD0: 33,
    0x7CD4: 29,
    0x7CD8: 36,
    0x7CDC: 42,
    0x7CE0: 36,
    0x7CE4: 32,
    0x7CE8: 29,
    0x7CEC: 29,
    0x7CF0: 33,
    0x7CF4: 30,
    0x7CF8: 29,
    0x7CFC: 30,
    0x7D00: 31,
    0x7D04: 42,
    0x7D08: 32,
    0x7D0C: 35,
    0x7D10: 33,
    0x7D14: 29,
    0x7D18: 37,
    0x7D1C: 30,
    0x7D20: 37,
    0x7D24: 30,
    0x7D28: 32,
    0x7D2C: 37,
    0x7D30: 29,
    0x7D34: 31,
    0x7D38: 40,
    0x7D3C: 33,
    0x7D40: 37,
    0x7D44: 30,
    0x7D48: 37,
    0x7D4C: 35,
    0x7D50: 35,
    0x7D54: 33,
    0x7D58: 29,
    0x7D5C: 36,
    0x7D60: 29,
    0x7D64: 35,
    0x7D68: 29,
    0x7D6C: 31,
    0x7D70: 30,
    0x7D74: 34,
    0x7D78: 30,
    0x7D7C: 29,
    0x7D80: 29,
    0x7D84: 43,
    0x7D88: 32,
    0x7D8C: 33,
    0x7D90: 46,
    0x7D94: 32,
    0x7D98: 31,
    0x7D9C: 30,
    0x7DA0: 30,
    0x7DA4: 30,
    0x7DA8: 32,
    0x7DAC: 31,
    0x7DB0: 37,
    0x7DB4: 31,
    0x7DB8: 30,
    0x7DBC: 29,
    0x7DC0: 30,
    0x7DC4: 38,
    0x7DC8: 31,
    0x7DCC: 31,
    0x7DD0: 34,
    0x7DD4: 30,
    0x7DD8: 32,
    0x7DDC: 34,
    0x7DE0: 31,
    0x7DE4: 36,
    0x7DE8: 34,
    0x7DEC: 34,
    0x7DF0: 31,
    0x7DF4: 30,
    0x7DF8: 44,
    0x7DFC: 29,
    0x7E00: 29,
    0x7E04: 29,
    0x7E08: 35,
    0x7E0C: 29,
    0x7E10: 34,
    0x7E14: 29,
    0x7E18: 34,
    0x7E1C: 30,
    0x7E20: 37,
    0x7E24: 29,
    0x7E28: 29,
    0x7E2C: 36,
    0x7E30: 33,
    0x7E34: 31,
    0x7E38: 32,
    0x7E3C: 29,
    0x7E40: 35,
    0x7E44: 30,
    0x7E48: 31,
    0x7E4C: 38,
    0x7E50: 33,
    0x7E54: 37,
    0x7E58: 29,
    0x7E5C: 30,
    0x7E60: 33,
    0x7E64: 29,
    0x7E68: 30,
    0x7E6C: 30,
    0x7E70: 29,
    0x7E74: 30,
    0x7E78: 30,
    0x7E7C: 30,
    0x7E80: 46,
    0x7E84: 41,
    0x7E88: 48,
    0x7E8C: 29,
    0x7E90: 31,
    0x7E94: 44,
    0x7E98: 34,
    0x7E9C: 30,
    0x7EA0: 37,
    0x7EA4: 37,
    0x7EA8: 34,
    0x7EAC: 34,
    0x7EB0: 30,
    0x7EB4: 30,
    0x7EB8: 30,
    0x7EBC: 36,
    0x7EC0: 36,
    0x7EC4: 34,
    0x7EC8: 29,
    0x7ECC: 29,
    0x7ED0: 29,
    0x7ED4: 31,
    0x7ED8: 43,
    0x7EDC: 30,
    0x7EE0: 33
}


function ArcadeCompletion() => 
    sum_of(range(0x7714,0x7EE0,step=4), addr => dword(addr)/dword(addr))

function ArcadePerfect(target) => 
    tally_of(range(0x7714,0x7EE0,step=4), target, addr => once(dword(addr) == ArcadeTarget[addr]))

function PrevArcadePerfect(target) => 
    tally_of(range(0x7714,0x7EE0,step=4), target, addr => once(prev(dword(addr)) == ArcadeTarget[addr]))
    
function AchievementArcade(points,puzzles)
{
    achievement(title = ArcadeAchTitle[puzzles],
                description = "Complete " + puzzles + " Arcade puzzles",
                points = points,
                trigger = 
                           prev(ArcadeCompletion()) == puzzles - 1
                        && measured(ArcadeCompletion() == puzzles, GameStatus != 0)
                        && GameStatus == 3
                )
}

function AchievementPerfect(points,puzzles)
{
    achievement(title = ArcadePerfectTitle[puzzles],
                description = "Earn an A+ rating on " + puzzles + " Arcade puzzles",
                points = points,
                trigger = 
                           PrevArcadePerfect(puzzles -1)
                        && measured(ArcadePerfect(puzzles))
                        && never(PrevArcadePerfect(puzzles))
                        && GameStatus == 3
                        && never(GameStatus == 0)
                )
}

achievement(
    title = "Dirty Laundry", points = 5,
    description = "Finish all of the Trainee puzzles and earn a promotion",
    trigger = CurrentLevel == 10 && GameStatus == 3 
                && prev(StoryComplete) == 9 && StoryComplete == 10
)
achievement(
    title = "Life and Death Luggage", points = 5,
    description = "Finish all of the Recruit puzzles and earn a promotion",
    trigger = CurrentLevel == 20 && GameStatus == 3 
                && prev(StoryComplete) == 19 && StoryComplete == 20
)
achievement(
    title = "Photos and Paintings and Pasta, Oh My!", points = 10,
    description = "Finish all of the Senior puzzles and earn a promotion",
    trigger = CurrentLevel == 30 && GameStatus == 3 
                && prev(StoryComplete) == 29 && StoryComplete == 30
)
achievement(
    title = "Exceptional Case", points = 10,
    description = "Finish all of the Expert puzzles and earn a promotion",
    trigger = CurrentLevel == 40 && GameStatus == 3 
                && prev(StoryComplete) == 39 && StoryComplete == 40 
)
achievement(
    title = "Classified Information", points = 10,
    description = "Finish all of the Officer puzzles and become the best Luggage Retriever around",
    trigger = CurrentLevel == 50 && GameStatus == 3 
                && prev(StoryComplete) == 49 && StoryComplete == 50 
)
//achievement(
  //  title = "Arcade Trainee I", points = 0,
    //description = "Finish 10 Arcade puzzles",
 //   trigger = prev(ArcadeCompletion()) == 9 
   //             && measured(ArcadeCompletion() == 10)
    //            && GameStatus == 3
//)
//achievement(
//title = "A+ Tracker 2", points = 5, 
//    description = "Get 5 A+",
//    trigger = PrevArcadePerfect(4)
//                && ArcadePerfect(5)
//                && never(PrevArcadePerfect(5))
 //               && GameStatus == 3
//                && never(GameStatus == 0)
//)

//Arcade Achievements (points, target)
AchievementArcade(5,10)
AchievementPerfect(10,10)
AchievementArcade(5,20)
AchievementPerfect(10,20)
AchievementArcade(5,30)
AchievementPerfect(10,30)
AchievementArcade(5,40)
AchievementPerfect(10,40)
AchievementArcade(5,50)
AchievementPerfect(10,50)
AchievementArcade(5,60)
AchievementPerfect(10,60)
AchievementArcade(5,70)
AchievementPerfect(10,70)
AchievementArcade(5,80)
AchievementPerfect(10,80)
AchievementArcade(5,90)
AchievementPerfect(10,90)
AchievementArcade(5,100)
AchievementPerfect(10,100)
AchievementArcade(5,110)
AchievementPerfect(10,110)
AchievementArcade(5,120)
AchievementPerfect(10,120)
AchievementArcade(5,130)
AchievementPerfect(10,130)
AchievementArcade(5,140)
AchievementPerfect(10,140)
AchievementArcade(5,150)
AchievementPerfect(10,150)
AchievementArcade(5,160)
AchievementPerfect(10,160)
AchievementArcade(5,170)
AchievementPerfect(10,170)
AchievementArcade(5,180)
AchievementPerfect(10,180)
AchievementArcade(5,190)
AchievementPerfect(10,190)
AchievementArcade(5,200)
AchievementPerfect(10,200)
AchievementArcade(5,210)
AchievementPerfect(10,210)
AchievementArcade(5,220)
AchievementPerfect(10,220)
AchievementArcade(5,230)
AchievementPerfect(10,230)
AchievementArcade(5,240)
AchievementPerfect(10,240)
AchievementArcade(5,250)
AchievementPerfect(10,250)
AchievementArcade(5,260)
AchievementPerfect(10,260)
AchievementArcade(5,270)
AchievementPerfect(10,270)
AchievementArcade(5,280)
AchievementPerfect(10,280)
AchievementArcade(5,290)
AchievementPerfect(10,290)
AchievementArcade(5,300)
AchievementPerfect(10,300)
AchievementArcade(5,310)
AchievementPerfect(10,310)
AchievementArcade(5,320)
AchievementPerfect(10,320)
AchievementArcade(5,330)
AchievementPerfect(10,330)
AchievementArcade(5,340)
AchievementPerfect(10,340)
AchievementArcade(5,350)
AchievementPerfect(10,350)
AchievementArcade(5,360)
AchievementPerfect(10,360)
AchievementArcade(5,370)
AchievementPerfect(10,370)
AchievementArcade(5,380)
AchievementPerfect(10,380)
AchievementArcade(5,390)
AchievementPerfect(10,390)
AchievementArcade(5,400)
AchievementPerfect(10,400)
AchievementArcade(10,410)
AchievementPerfect(10,410)
AchievementArcade(10,420)
AchievementPerfect(10,420)
AchievementArcade(10,430)
AchievementPerfect(10,430)
AchievementArcade(10,440)
AchievementPerfect(10,440)
AchievementArcade(10,450)
AchievementPerfect(10,450)
AchievementArcade(10,460)
AchievementPerfect(10,460)
AchievementArcade(10,470)
AchievementPerfect(10,470)
AchievementArcade(10,480)
AchievementPerfect(10,480)
AchievementArcade(10,490)
AchievementPerfect(10,490)
AchievementArcade(10,500)
AchievementPerfect(10,500)

rich_presence_conditional_display((byte(0x00A630) == 0), "Getting ready for work"
)

rich_presence_conditional_display((byte(0x00A630) >= 6), "Taking a break on the menu | Story [{0} / 50] | Arcade [{1} / 500] | A+ [{2} / 500]",
    rich_presence_value("Digit", dword(0x007710), format="VALUE"),
    rich_presence_value("Digit", ArcadeCompletion(), format="VALUE"),
    rich_presence_value("Digit", ArcadePerfect(500), format="VALUE")
)

rich_presence_conditional_display(dword(0x006488) > 50, "Working hard on Arcade Puzzle #{0} as a Luggage Retrieval {1} | Story [{2} / 50] | Arcade [{3} / 500] | A+ [{4} / 500]",
    rich_presence_value("Digit", dword(0x006494) + 1, format="VALUE"),
    rich_presence_lookup("Rank", dword(0x007710), RankLookup),
    rich_presence_value("Digit", dword(0x007710), format="VALUE"),
    rich_presence_value("Digit", ArcadeCompletion(), format="VALUE"),
    rich_presence_value("Digit", ArcadePerfect(500), format="VALUE")
)

rich_presence_display("Working hard on Story Puzzle #{0} as a Luggage Retrieval {1} | Story [{2} / 50] | Arcade [{3} / 500] | A+ [{4} / 500]",
    rich_presence_value("Digit", dword(0x006488), format="VALUE"),
    rich_presence_lookup("Rank", dword(0x007710), RankLookup),
    rich_presence_value("Digit", dword(0x007710), format="VALUE"),
    rich_presence_value("Digit", ArcadeCompletion(), format="VALUE"),
    rich_presence_value("Digit", ArcadePerfect(500), format="VALUE")
)