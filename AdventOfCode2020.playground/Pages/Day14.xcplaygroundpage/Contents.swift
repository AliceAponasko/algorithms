import Foundation

let input =
"""
mask = X11001110001101XX01111X1001X01101111
mem[32163] = 23587
mem[59015] = 3487205
mem[25831] = 33360
mem[62711] = 224797
mem[41307] = 1818
mask = 1010001X010111X00101X1X101X1X01010X0
mem[45083] = 11122937
mem[3480] = 10
mem[46489] = 4658914
mem[10554] = 14018239
mem[46503] = 702809
mem[40599] = 21908484
mask = 1X0X0111001X1X1000X11X11000110011000
mem[27073] = 1598154
mem[56277] = 895
mem[64440] = 121221812
mem[36973] = 803170
mask = 01X0101101011X110X11XX0111111010X011
mem[56954] = 862350849
mem[56448] = 732
mem[57698] = 10805529
mem[9948] = 743476
mem[54082] = 27464
mem[26950] = 13890763
mask = 1010001101XX11X0X10X000X00001X11X00X
mem[4270] = 361512
mem[8603] = 140991
mem[11543] = 11280669
mem[48952] = 13983
mem[23994] = 160573183
mem[21654] = 16471299
mask = 1X0011X0XX10001000X1011XX1X110X10000
mem[54082] = 204797
mem[2442] = 88978843
mem[43594] = 10538
mem[50284] = 1009918861
mem[44229] = 496323
mem[12926] = 20879
mem[49547] = 4018180
mask = 1010X0X1X10111X0X10X0X0000XX10011110
mem[21387] = 1595920
mem[49543] = 426267846
mem[33458] = 232911215
mem[12713] = 36660
mem[25009] = 1531450
mem[160] = 41645
mem[62607] = 29094926
mask = 10X1X1010011X0100X0X0X10X1X0X0111000
mem[41099] = 556
mem[35924] = 165390
mem[4217] = 95434
mem[29377] = 256242448
mem[65298] = 219301
mem[2150] = 513838120
mask = 101000X1X1X1110011XXX000110001X01000
mem[40639] = 152100
mem[47089] = 234875
mem[21980] = 108670
mem[13822] = 351059
mask = 1X1011110111X11100010X100001X00110XX
mem[48992] = 3047
mem[56444] = 201961239
mem[21371] = 204
mem[24671] = 3709
mask = 101X10010X01111011010101000X0001X010
mem[391] = 1771
mem[9761] = 167201870
mem[26810] = 35048
mask = X1100111X001001110X1XX1X1101X110001X
mem[58134] = 62107560
mem[1977] = 431050
mask = XX1101110001X01XX0110111X11011X0X100
mem[61811] = 3322
mem[45400] = 126787711
mem[11959] = 231430790
mem[6529] = 50711275
mask = 1010011100X110X10X010X011X10X001X101
mem[35664] = 4018
mem[51789] = 1147
mem[9164] = 2673
mem[3887] = 6903395
mask = 1XX01101001XX0X10001X100X10X00011011
mem[45588] = 44392
mem[45672] = 130449
mem[10651] = 199
mem[13830] = 609557
mem[16601] = 9139
mem[39047] = 7390
mem[15735] = 2200
mask = X1100111X0011001001X10010100XX0X1100
mem[47001] = 12904
mem[60088] = 78
mem[16541] = 35014846
mem[36988] = 274445
mem[64869] = 721
mask = 111001101001001X1XX1010011X0111X1000
mem[47089] = 484293694
mem[32833] = 1324010
mem[573] = 621230513
mem[30223] = 4408118
mem[21631] = 108617
mask = 101X0101001XX0XX00011X10101X0111010X
mem[818] = 847
mem[7536] = 12876
mem[61097] = 637
mask = X11X01110X0110X01011011X1011XX000101
mem[1160] = 2769715
mem[11521] = 389
mask = 1X0X1X11X0X110110X011101100111001011
mem[18913] = 2463
mem[60014] = 22803235
mem[37134] = 6832
mem[62311] = 85539171
mem[35150] = 1323288
mem[48099] = 1648075
mask = 10001X11X11110100X0101X01001X0001011
mem[48089] = 20
mem[4229] = 1868
mem[51778] = 69531
mem[6163] = 803954017
mask = 10X000110011X0100XX1110X011001X00000
mem[44294] = 12646
mem[17281] = 484
mem[19939] = 492
mask = 0XX0X11100XX1X1100111110X1100X001100
mem[47104] = 5349940
mem[12968] = 633
mem[27118] = 388686386
mem[22054] = 1418
mem[26460] = 3963
mem[27686] = 324058
mem[8678] = 406066094
mask = X1001X1011X0001000X1X0001101XX111X11
mem[34728] = 4733
mem[19944] = 3955289
mem[73] = 2844
mem[5056] = 3114323
mem[61113] = 3346
mask = 0XX011100001101010X1010X101X11XX1000
mem[13529] = 4870075
mem[32746] = 30227
mem[16882] = 5182
mem[58506] = 3864
mask = 101011X1001X100101X10X01000000001101
mem[16135] = 1425313
mem[59176] = 2841231
mem[26460] = 54607
mem[7136] = 12152
mask = 1010X11X001X10X1000X100X000101X1010X
mem[23809] = 464
mem[41790] = 25173055
mem[19793] = 119
mask = XX00101011000010001100000X11001XX00X
mem[34368] = 338852
mem[1953] = 158
mem[33469] = 240238
mem[26651] = 39001013
mem[52523] = 39414
mem[43956] = 4612
mask = 10110X11XX11101100001010101X00000110
mem[50811] = 5113517
mem[53419] = 58853
mem[23534] = 234
mem[27568] = 164916174
mem[16184] = 967
mem[56977] = 14248978
mem[9076] = 338687637
mask = 100011010010000XX0011001X1X110000100
mem[49329] = 7872
mem[62711] = 917801821
mem[20767] = 9510
mem[41836] = 9669
mask = 011001X000X110110X111X01101X0X1110X0
mem[58112] = 8759
mem[59015] = 249132
mem[2696] = 6617538
mem[4055] = 322572
mem[35039] = 14480645
mem[33920] = 1480
mem[24136] = 1072057057
mask = 101011X1001XX0100001X00001X1001X0000
mem[23619] = 1830
mem[23927] = 29452
mem[64905] = 150741701
mem[60932] = 18507
mask = 10X0011X011X10110X0XX100101X00010X01
mem[54685] = 201370
mem[18104] = 2839230
mem[62384] = 7435156
mem[63305] = 444204
mask = 01101X01X0011011001111XX110X000X0XX1
mem[23354] = 50190934
mem[33372] = 2936904
mem[51383] = 965780683
mask = X11001X1000110X100110X011X101XXX0X00
mem[22184] = 43654247
mem[45672] = 88907038
mask = XXX001110011X0XX1001XX01X01010010010
mem[8280] = 44185
mem[53900] = 276378856
mask = 1010011101X1X0110X01001100X01X1100X1
mem[31239] = 200025883
mem[19233] = 22660998
mem[54966] = 459709
mem[21900] = 128456203
mem[27568] = 45525987
mem[18207] = 1317041
mem[4755] = 1465553
mask = 101XX111X01110X10X01X11100010000110X
mem[9761] = 6212379
mem[6490] = 15160
mem[32338] = 454253
mem[21371] = 528675530
mem[57305] = 149
mask = 111X011110011001001X00110X01X1000001
mem[5685] = 876
mem[38670] = 90390560
mask = 10100111X011X0110001001XX01100001XX0
mem[19086] = 153283033
mem[22316] = 982
mem[9660] = 648
mem[38272] = 7464642
mem[23530] = 1073526128
mask = 1X0011X0101X0010001111000100XX1110X0
mem[61800] = 1612
mem[25746] = 12896802
mem[59222] = 402335
mask = 10110111001110XX010101X11000X101X110
mem[5330] = 38096565
mem[48438] = 3312971
mem[50454] = 213
mem[51532] = 35683154
mem[2857] = 162001059
mask = X110X1X0001110110XX1XX01X00X10111010
mem[35384] = 487
mem[8386] = 4875
mem[818] = 25314
mem[9902] = 809
mask = 01101X1000010010X01100X0X00111000101
mem[11465] = 6937
mem[9166] = 8060
mem[30630] = 88490
mem[35039] = 58041908
mask = 1010X11001011X11010XX0X100X11X110101
mem[31189] = 12546611
mem[61841] = 10859
mem[18402] = 3088
mem[46169] = 298
mem[42469] = 10635847
mask = 111X1101X011X01100X11XX101X00X0X1111
mem[9917] = 2696
mem[8987] = 613809199
mem[29213] = 462633736
mem[3210] = 5696
mask = 100010110111101001010100100XX00010XX
mem[22919] = 1049
mem[32274] = 1304246
mem[50722] = 3730781
mem[25729] = 473131
mem[33167] = 255409
mem[954] = 847404
mask = XX1011X0000100100X11011110110XX01010
mem[64019] = 453
mem[33921] = 68992034
mem[11994] = 5228
mask = 0110XX1000010X101011100X11000XX0X101
mem[35244] = 747081
mem[2508] = 46321
mask = 100011110111101001010110X001X0X00X01
mem[33072] = 189542868
mem[22582] = 495965
mem[40368] = 152283413
mem[12558] = 12822
mem[28400] = 130947363
mem[5692] = 50965428
mask = 1X10X11100010011101111000111X10001X0
mem[52617] = 3163
mem[28750] = 3075
mem[11316] = 18721092
mask = 011X1011X101X11X00X110000X1001111011
mem[36035] = 1783926
mem[18174] = 89261
mem[6538] = 434889
mask = 011011100X011010101101X0111001X0100X
mem[25969] = 10970
mem[2186] = 132591
mask = 10101X0X01111110000111X000010101X01X
mem[7956] = 20198
mem[32632] = 9868915
mem[17009] = 616154170
mem[33337] = 1948
mem[28455] = 314
mem[19300] = 437925314
mem[53760] = 9859
mask = X01X0X11010111X0010110111X1X0011X00X
mem[54194] = 60308
mem[55677] = 10602
mem[47982] = 6803
mask = 1010011XX0X110111101111X11101X1X0000
mem[12226] = 26775502
mem[7654] = 1776936
mem[25032] = 9029
mem[63355] = 2515
mem[44393] = 51402
mem[19754] = 538701
mask = 101001X1001110110011001100XXX0001XX1
mem[17878] = 2952
mem[28744] = 1204082
mem[44294] = 167
mem[54229] = 1360071
mem[58603] = 5499
mask = 1010011100X110X11X011XX01110101110XX
mem[19454] = 484695
mem[51120] = 2797
mem[24926] = 2203
mem[62232] = 2795361
mem[4928] = 135948629
mask = 101011X10111XX1X0001011X0000010XX00X
mem[51586] = 51038500
mem[16550] = 10911116
mem[39368] = 31165
mem[49995] = 2240467
mem[20935] = 58885075
mask = 01X00110X0X1101X10111XX1000011000001
mem[60395] = 14487
mem[45597] = 58180
mem[4169] = 20594
mem[28774] = 3668360
mem[46407] = 161563088
mask = 10101X0101011X000100X0000X0010010110
mem[21371] = 8802
mem[32905] = 123119533
mem[4770] = 106677838
mask = 11X0X10100111011X0010011111000X111X0
mem[43143] = 7717
mem[9164] = 377145
mem[39883] = 57
mask = 1011X101001000100001001X10100X0100X1
mem[43124] = 5241585
mem[22122] = 960211786
mem[31235] = 4256719
mem[32461] = 560355
mem[62468] = 18038
mask = 1010011001X1X0X101X101010000X1010001
mem[48307] = 186177048
mem[11940] = 218581
mem[44812] = 72594882
mem[32461] = 794715
mem[40357] = 142382
mem[9612] = 7990
mem[32943] = 2523
mask = X110X11X0001X01X1011XXX011X011001000
mem[4569] = 390383592
mem[8258] = 223605244
mem[14022] = 27470197
mem[44813] = 1232213
mem[15480] = 364141654
mask = 1X1011X100X100110001X001001010101011
mem[21024] = 32037758
mem[38961] = 4442700
mem[60415] = 478809
mem[9366] = 1425318
mem[18104] = 4027612
mem[48952] = 1698
mem[9164] = 3844
mask = 1X10011X100XX001001XX0110110000X01X1
mem[63362] = 961021193
mem[61648] = 10624
mem[8540] = 1240358
mem[22072] = 180594
mem[45028] = 48614278
mem[51941] = 437953
mask = X010001X011X10100101XX0X011101XX0100
mem[28400] = 20048177
mem[38442] = 42972
mem[19202] = 137
mask = 1110X10X0011001X00110000X00X101X101X
mem[45776] = 29115
mem[46228] = 82002990
mask = 0110011100X1X011101101X10100110X11X0
mem[2178] = 1415
mem[7573] = 59211
mem[63355] = 14666328
mask = 111111011X11001100010X1XX100X000111X
mem[36973] = 251101
mem[45549] = 49149
mem[11185] = 11173
mem[36931] = 9105286
mem[34000] = 191861
mem[4112] = 5803908
mem[46851] = 898742
mask = 101010X10101X10011000X0000000001111X
mem[21952] = 58087941
mem[7811] = 310568
mem[12683] = 7296
mem[40986] = 1593
mem[4484] = 217102381
mask = 111X01X00X011011101111001X0011000010
mem[34000] = 42900698
mem[29787] = 486803
mem[16456] = 314970629
mem[2178] = 127921
mem[5330] = 3477920
mem[41836] = 507753704
mem[19939] = 1233
mask = 10X11X1110X1X011010111X0000101011110
mem[42088] = 43182
mem[55372] = 7107
mem[20352] = 707842
mem[38160] = 4365
mask = 10X101XX1011X0X1X0010101X0010100X011
mem[57996] = 825
mem[9164] = 38731
mem[10590] = 1024
mask = 0110XXXX0X011011001111X11010XX0X1000
mem[43004] = 23865126
mem[26521] = 62786105
mem[58508] = 16251607
mem[44915] = 6296
mem[50928] = 15905704
mem[28304] = 6883261
mask = 10000X1X0111101000010001X01110X0110X
mem[38961] = 892
mem[21387] = 654
mem[40691] = 70505975
mask = 011X10110001101XX0111011111XX0X00000
mem[26664] = 190634
mem[41638] = 58433745
mem[33818] = 31913
mask = 1110110000111X110101000X00X0X010001X
mem[21371] = 827
mem[48330] = 554110094
mem[4159] = 13842042
mem[28294] = 10751539
mem[4122] = 3155
mem[56641] = 143543
mask = 10X0110XX010X0XX0X01010010000001100X
mem[42088] = 28605
mem[26003] = 2052146
mem[2810] = 12539132
mem[19177] = 873302110
mem[45682] = 198549
mem[53419] = 12015
mask = 01101100000X0XX00001X110110000111X00
mem[13216] = 42793
mem[32720] = 1691682
mem[61256] = 2824
mask = 10100111XX111X0X01010001001XX1010101
mem[9076] = 33
mem[35540] = 2369998
mem[56213] = 472
mask = 0X0010X011000010X0111000X10100001001
mem[33599] = 292
mem[48557] = 63
mem[61148] = 84252
mem[21382] = 4805
mem[21707] = 599022397
mask = 0110X1110X01X011101100X0110101000001
mem[2445] = 15421
mem[22230] = 421726
mem[31424] = 179041731
mem[64905] = 287710
mem[46793] = 19157238
mask = 10100110X10X00X10101111X11X10100X101
mem[388] = 231948622
mem[21332] = 55144051
mem[25129] = 24447
mem[2442] = 458
mask = 11101100000X001X000101X01010X1011010
mem[19300] = 1121636
mem[48626] = 4127847
mem[37338] = 2796197
mem[22754] = 385623
mem[3467] = 12303468
mask = X11011X0000X0010X0X100010X00111100X0
mem[20168] = 46314
mem[30633] = 7925538
mem[32746] = 7822
mem[37513] = 22922
mem[9366] = 8809
mask = 11100X1100010011101100X0101000011XX1
mem[21371] = 544068236
mem[65001] = 127152183
mem[9112] = 4281720
mem[33376] = 54760474
mem[27066] = 47706947
mem[10567] = 20664563
mask = 10X00X11X01110010X010X11011001010100
mem[41952] = 16538323
mem[44409] = 127
mem[32732] = 88470340
mem[39136] = 1209
mem[52852] = 4841355
mem[57307] = 18767970
mask = 10100X110X111X100101X1X010010X0000X0
mem[60932] = 43059
mem[38522] = 266295
mem[14489] = 257072
mem[56504] = 4614424
mem[47257] = 103706
mem[51586] = 11495785
mask = 101XXXX100111011000X10100011X101010X
mem[954] = 515172677
mem[53419] = 2673
mem[34982] = 737
mem[4945] = 23383
mask = 001001X1001X111100X110X011X0X0000100
mem[55053] = 1024580
mem[55436] = 18571176
mem[22582] = 1874
mem[39435] = 78890341
mem[31752] = 4058
mem[4134] = 1478
mask = 10X0X1110X11101X0X01X10110X01X001X01
mem[24668] = 15910647
mem[35266] = 766999241
mem[57305] = 145297
mem[7722] = 249220230
mem[11092] = 35301
mem[47089] = 5070
mask = 0110011000011011X011XXX0X0001100X0X0
mem[43956] = 78016
mem[3712] = 87083821
mem[36931] = 3887
mem[50618] = 38029
mask = 101001X0010110110101X11X0X01X101010X
mem[4168] = 66691
mem[51120] = 276061
mem[7259] = 8999648
mask = 11000XX1000X001X1X111010010X00000X0X
mem[26947] = 6243
mem[14746] = 166248
mem[59885] = 723042
mem[45400] = 53392
mem[44876] = 749
mem[59029] = 1815
mask = X0101X010011X01X0001X1100011111011X0
mem[6490] = 1443315
mem[9164] = 900
mem[29237] = 868260102
mem[53419] = 893281
mem[61685] = 1369185
mem[4228] = 739257
mem[45110] = 4469052
mask = 11X0011XX0X100111011100X1X0XX1001001
mem[19944] = 33579152
mem[9221] = 53082
mem[12164] = 85657
mem[18757] = 6173
mem[9612] = 38383098
mem[41658] = 441286882
mask = XX10011100X11011X0X111X1XX1X10011000
mem[15544] = 380788
mem[19086] = 141583
mem[34269] = 9666
mem[22877] = 1051665868
mem[32360] = 7
mask = 1X1011110011X011000X1010X0111X1010X1
mem[13883] = 5817
mem[4217] = 15681
mem[8703] = 171924
"""

extension Int {
    var binary: String {
        var binary = String(self, radix: 2)
        while binary.count < Constant.Memory.valueCount {
            binary.insert("0", at: binary.startIndex)
        }
        return binary
    }
}

extension String {
    var decimal: Int? { Int(self, radix: 2) }
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

enum Constant {
    enum Mask {
        static let prefix = "mask = "
        static let x: Character = "X"
        static let zero: Character = "0"
        static let one: Character = "1"
    }
    enum Memory {
        static let prefixIndex = "mem["
        static let prefixValue = "] = "
        static let valueCount = 36
    }
}

struct MemoryValue {
    let index: Int
    let value: Int
}

struct Instruction {
    let mask: String
    let values: [MemoryValue]
}

func parse(input: String) -> [Instruction] {
    var result = [Instruction]()
    var currentMask = ""
    var currentMemoryValues = [MemoryValue]()

    input.components(separatedBy: .newlines).forEach {
        if let maskIndex = $0.range(of: Constant.Mask.prefix)?.upperBound {
            if !currentMask.isEmpty {
                result.append(Instruction(mask: currentMask, values: currentMemoryValues))
                currentMemoryValues.removeAll()
            }

            currentMask = String($0.suffix(from: maskIndex))
        } else if let memoryIndex = $0.range(of: Constant.Memory.prefixIndex)?.upperBound,
                  let valueIndexBeginning = $0.range(of: Constant.Memory.prefixValue)?.lowerBound,
                  let valueIndexEnd = $0.range(of: Constant.Memory.prefixValue)?.upperBound,
                  let memory = Int($0[memoryIndex..<valueIndexBeginning]),
                  let value = Int($0.suffix(from: valueIndexEnd)) {
            currentMemoryValues.append(MemoryValue(index: memory, value: value))
        }
    }

    result.append(Instruction(mask: currentMask, values: currentMemoryValues))
    return result
}

func parse(value: Int, through mask: String) -> String {
    var binary = value.binary
    for i in 0..<mask.count {
        if mask[i] != Constant.Mask.x {
            let replacingIndex = binary.index(binary.startIndex, offsetBy: i)
            binary.replaceSubrange(replacingIndex...replacingIndex, with: String(mask[i]))
        }
    }

    return binary
}

func computeUnchangedMemory(from instructions: [Instruction]) -> [Int: Int] {
    var result = [Int: Int]()

    instructions.forEach { instruction in
        instruction.values.forEach {
            result[$0.index] = parse(value: $0.value, through: instruction.mask).decimal
        }
    }

    return result
}

print(computeUnchangedMemory(from: parse(input: input)).values.reduce(0, +))

func parse(memory: Int, through mask: String) -> [Int] {
    var binary = memory.binary
    var result = [Int]()

    for i in 0..<mask.count {
        if mask[i] == Constant.Mask.zero {
            continue
        } else if mask[i] == Constant.Mask.one || mask[i] == Constant.Mask.x {
            let replacingIndex = binary.index(binary.startIndex, offsetBy: i)
            binary.replaceSubrange(replacingIndex...replacingIndex, with: String(mask[i]))
        }
    }

    var binaries = [String]()
    for i in 0..<binary.count {
        if binary[i] == Constant.Mask.x {
            if binaries.isEmpty {
                binaries.append("0")
                binaries.append("1")
            } else {
                binaries = binaries.map { $0 + "0" } + binaries.map { $0 + "1" }
            }
        } else {
            if binaries.isEmpty {
                binaries.append("\(binary[i])")
            } else {
                binaries = binaries.map { $0 + "\(binary[i])" }
            }
        }
    }

    result.append(contentsOf: binaries.map { $0.decimal! }.sorted())
    return result
}

func computeFloatingMemory(from instructions: [Instruction]) -> [Int: Int] {
    var result = [Int: Int]()

    instructions.forEach { instruction in
        instruction.values.forEach { memoryValue in
            parse(memory: memoryValue.index, through: instruction.mask).forEach {
                result[$0] = memoryValue.value
            }
        }
    }

    return result
}

print(computeFloatingMemory(from: parse(input: input)).values.reduce(0, +))
