; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [208 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [416 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 157
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 156
	i32 42639949, ; 2: System.Threading.Thread => 0x28aa24d => 194
	i32 66541672, ; 3: System.Diagnostics.StackTrace => 0x3f75868 => 139
	i32 67008169, ; 4: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 68219467, ; 5: System.Security.Cryptography.Primitives => 0x410f24b => 183
	i32 72070932, ; 6: Microsoft.Maui.Graphics.dll => 0x44bb714 => 82
	i32 98325684, ; 7: Microsoft.Extensions.Diagnostics.Abstractions => 0x5dc54b4 => 58
	i32 117431740, ; 8: System.Runtime.InteropServices => 0x6ffddbc => 172
	i32 122350210, ; 9: System.Threading.Channels.dll => 0x74aea82 => 192
	i32 142721839, ; 10: System.Net.WebHeaderCollection => 0x881c32f => 164
	i32 149972175, ; 11: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 183
	i32 159306688, ; 12: System.ComponentModel.Annotations => 0x97ed3c0 => 131
	i32 165246403, ; 13: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 94
	i32 182336117, ; 14: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 113
	i32 195452805, ; 15: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 16: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 17: System.ComponentModel => 0xc38ff48 => 134
	i32 209399409, ; 18: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 92
	i32 221958352, ; 19: Microsoft.Extensions.Diagnostics.dll => 0xd3ad0d0 => 57
	i32 230752869, ; 20: Microsoft.CSharp.dll => 0xdc10265 => 123
	i32 244348769, ; 21: Microsoft.AspNetCore.Components.Authorization => 0xe907761 => 39
	i32 254259026, ; 22: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 38
	i32 280992041, ; 23: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 291275502, ; 24: Microsoft.Extensions.Http.dll => 0x115c82ee => 64
	i32 317674968, ; 25: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 26: Xamarin.AndroidX.Activity.dll => 0x13031348 => 89
	i32 330147069, ; 27: Microsoft.SqlServer.Server => 0x13ada4fd => 83
	i32 336156722, ; 28: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 29: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 101
	i32 356389973, ; 30: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 367780167, ; 31: System.IO.Pipes => 0x15ebe147 => 149
	i32 374914964, ; 32: System.Transactions.Local => 0x1658bf94 => 197
	i32 375677976, ; 33: System.Net.ServicePoint.dll => 0x16646418 => 161
	i32 379916513, ; 34: System.Threading.Thread.dll => 0x16a510e1 => 194
	i32 385762202, ; 35: System.Memory.dll => 0x16fe439a => 153
	i32 392610295, ; 36: System.Threading.ThreadPool.dll => 0x1766c1f7 => 195
	i32 395744057, ; 37: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 38: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 39: System.Collections => 0x1a61054f => 130
	i32 450948140, ; 40: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 100
	i32 451504562, ; 41: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 184
	i32 459347974, ; 42: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 177
	i32 469710990, ; 43: System.dll => 0x1bff388e => 202
	i32 485463106, ; 44: Microsoft.IdentityModel.Abstractions => 0x1cef9442 => 71
	i32 498788369, ; 45: System.ObjectModel => 0x1dbae811 => 166
	i32 500358224, ; 46: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 47: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 48: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 68
	i32 530272170, ; 49: System.Linq.Queryable => 0x1f9b4faa => 151
	i32 539058512, ; 50: Microsoft.Extensions.Logging => 0x20216150 => 65
	i32 546455878, ; 51: System.Runtime.Serialization.Xml => 0x20924146 => 178
	i32 548916678, ; 52: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 45
	i32 571435654, ; 53: Microsoft.Extensions.FileProviders.Embedded.dll => 0x220f6a86 => 61
	i32 592146354, ; 54: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 613668793, ; 55: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 182
	i32 627609679, ; 56: Xamarin.AndroidX.CustomView => 0x2568904f => 98
	i32 627931235, ; 57: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 58: System.Text.Encodings.Web.dll => 0x27787397 => 189
	i32 672442732, ; 59: System.Collections.Concurrent => 0x2814a96c => 126
	i32 683518922, ; 60: System.Net.Security => 0x28bdabca => 160
	i32 688181140, ; 61: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 690569205, ; 62: System.Xml.Linq.dll => 0x29293ff5 => 198
	i32 706645707, ; 63: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 64: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 65: System.Runtime.Loader.dll => 0x2b15ed29 => 173
	i32 759454413, ; 66: System.Net.Requests => 0x2d445acd => 159
	i32 762598435, ; 67: System.IO.Pipes.dll => 0x2d745423 => 149
	i32 775507847, ; 68: System.IO.Compression => 0x2e394f87 => 146
	i32 777317022, ; 69: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 70: Microsoft.Extensions.Options => 0x2f0980eb => 67
	i32 804008546, ; 71: Microsoft.AspNetCore.Components.WebView.Maui => 0x2fec3262 => 43
	i32 804715423, ; 72: System.Data.Common => 0x2ff6fb9f => 136
	i32 823281589, ; 73: System.Private.Uri.dll => 0x311247b5 => 168
	i32 830298997, ; 74: System.IO.Compression.Brotli => 0x317d5b75 => 145
	i32 878954865, ; 75: System.Net.Http.Json => 0x3463c971 => 154
	i32 904024072, ; 76: System.ComponentModel.Primitives.dll => 0x35e25008 => 132
	i32 926902833, ; 77: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 966729478, ; 78: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 117
	i32 967690846, ; 79: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 101
	i32 975236339, ; 80: System.Diagnostics.Tracing => 0x3a20ecf3 => 141
	i32 975874589, ; 81: System.Xml.XDocument => 0x3a2aaa1d => 200
	i32 986514023, ; 82: System.Private.DataContractSerialization.dll => 0x3acd0267 => 167
	i32 992768348, ; 83: System.Collections.dll => 0x3b2c715c => 130
	i32 999186168, ; 84: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 63
	i32 1012816738, ; 85: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 111
	i32 1019214401, ; 86: System.Drawing => 0x3cbffa41 => 143
	i32 1028951442, ; 87: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 56
	i32 1029334545, ; 88: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 89: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 90
	i32 1036536393, ; 90: System.Drawing.Primitives.dll => 0x3dc84a49 => 142
	i32 1040658680, ; 91: InstaFood.Shared.dll => 0x3e0730f8 => 121
	i32 1044663988, ; 92: System.Linq.Expressions.dll => 0x3e444eb4 => 150
	i32 1048992957, ; 93: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0x3e865cbd => 58
	i32 1052210849, ; 94: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 103
	i32 1062017875, ; 95: Microsoft.Identity.Client.Extensions.Msal => 0x3f4d1b53 => 70
	i32 1082857460, ; 96: System.ComponentModel.TypeConverter => 0x408b17f4 => 133
	i32 1084122840, ; 97: Xamarin.Kotlin.StdLib => 0x409e66d8 => 118
	i32 1098259244, ; 98: System => 0x41761b2c => 202
	i32 1118262833, ; 99: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1138436374, ; 100: Microsoft.Data.SqlClient.dll => 0x43db2916 => 46
	i32 1157931901, ; 101: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 48
	i32 1168523401, ; 102: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1173126369, ; 103: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 59
	i32 1178241025, ; 104: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 108
	i32 1202000627, ; 105: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 48
	i32 1203215381, ; 106: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1204575371, ; 107: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 52
	i32 1208641965, ; 108: System.Diagnostics.Process => 0x480a69ad => 138
	i32 1234928153, ; 109: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 110: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 111: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 99
	i32 1309188875, ; 112: System.Private.DataContractSerialization => 0x4e08a30b => 167
	i32 1324164729, ; 113: System.Linq => 0x4eed2679 => 152
	i32 1335329327, ; 114: System.Runtime.Serialization.Json.dll => 0x4f97822f => 176
	i32 1373134921, ; 115: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 116: Xamarin.AndroidX.SavedState => 0x52114ed3 => 111
	i32 1406073936, ; 117: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 95
	i32 1408764838, ; 118: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 175
	i32 1430672901, ; 119: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1435222561, ; 120: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 117
	i32 1452070440, ; 121: System.Formats.Asn1.dll => 0x568cd628 => 144
	i32 1454105418, ; 122: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 60
	i32 1458022317, ; 123: System.Net.Security.dll => 0x56e7a7ad => 160
	i32 1460893475, ; 124: System.IdentityModel.Tokens.Jwt => 0x57137723 => 85
	i32 1461004990, ; 125: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 126: System.Collections.Immutable.dll => 0x5718a9ef => 127
	i32 1462112819, ; 127: System.IO.Compression.dll => 0x57261233 => 146
	i32 1469204771, ; 128: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 91
	i32 1470490898, ; 129: Microsoft.Extensions.Primitives => 0x57a5e912 => 68
	i32 1479771757, ; 130: System.Collections.Immutable => 0x5833866d => 127
	i32 1480492111, ; 131: System.IO.Compression.Brotli.dll => 0x583e844f => 145
	i32 1487239319, ; 132: Microsoft.Win32.Primitives => 0x58a57897 => 124
	i32 1493001747, ; 133: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1498168481, ; 134: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 72
	i32 1505131794, ; 135: Microsoft.Extensions.Http => 0x59b67d12 => 64
	i32 1514721132, ; 136: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1521091094, ; 137: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 63
	i32 1543031311, ; 138: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 191
	i32 1546581739, ; 139: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x5c2ef6eb => 43
	i32 1551623176, ; 140: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1565310744, ; 141: System.Runtime.Caching => 0x5d4cbf18 => 87
	i32 1573704789, ; 142: System.Runtime.Serialization.Json => 0x5dccd455 => 176
	i32 1582305585, ; 143: Azure.Identity => 0x5e501131 => 36
	i32 1604827217, ; 144: System.Net.WebClient => 0x5fa7b851 => 163
	i32 1622152042, ; 145: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 105
	i32 1624863272, ; 146: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 115
	i32 1628113371, ; 147: Microsoft.IdentityModel.Protocols.OpenIdConnect => 0x610b09db => 75
	i32 1636350590, ; 148: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 97
	i32 1639515021, ; 149: System.Net.Http.dll => 0x61b9038d => 155
	i32 1639986890, ; 150: System.Text.RegularExpressions => 0x61c036ca => 191
	i32 1654881142, ; 151: Microsoft.AspNetCore.Components.WebView => 0x62a37b76 => 42
	i32 1657153582, ; 152: System.Runtime => 0x62c6282e => 179
	i32 1658251792, ; 153: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 116
	i32 1677501392, ; 154: System.Net.Primitives.dll => 0x63fca3d0 => 158
	i32 1679769178, ; 155: System.Security.Cryptography => 0x641f3e5a => 185
	i32 1689493916, ; 156: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 47
	i32 1729485958, ; 157: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 93
	i32 1736233607, ; 158: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 159: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1744735666, ; 160: System.Transactions.Local.dll => 0x67fe8db2 => 197
	i32 1750313021, ; 161: Microsoft.Win32.Primitives.dll => 0x6853a83d => 124
	i32 1760259689, ; 162: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 41
	i32 1763938596, ; 163: System.Diagnostics.TraceSource.dll => 0x69239124 => 140
	i32 1766324549, ; 164: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 113
	i32 1770582343, ; 165: Microsoft.Extensions.Logging.dll => 0x6988f147 => 65
	i32 1780572499, ; 166: Mono.Android.Runtime.dll => 0x6a216153 => 206
	i32 1782862114, ; 167: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 168: Xamarin.AndroidX.Fragment => 0x6a96652d => 100
	i32 1793755602, ; 169: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1794500907, ; 170: Microsoft.Identity.Client.dll => 0x6af5e92b => 69
	i32 1796167890, ; 171: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 45
	i32 1800714753, ; 172: InstaFood.Shared => 0x6b54ba01 => 121
	i32 1808609942, ; 173: Xamarin.AndroidX.Loader => 0x6bcd3296 => 105
	i32 1813058853, ; 174: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 118
	i32 1813201214, ; 175: Xamarin.Google.Android.Material => 0x6c13413e => 116
	i32 1818569960, ; 176: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 109
	i32 1824175904, ; 177: System.Text.Encoding.Extensions => 0x6cbab720 => 188
	i32 1824722060, ; 178: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 175
	i32 1828688058, ; 179: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 66
	i32 1842015223, ; 180: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 181: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 182: System.Linq.Expressions => 0x6ec71a65 => 150
	i32 1871986876, ; 183: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 0x6f9440bc => 75
	i32 1875935024, ; 184: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1910275211, ; 185: System.Collections.NonGeneric.dll => 0x71dc7c8b => 128
	i32 1939592360, ; 186: System.Private.Xml.Linq => 0x739bd4a8 => 169
	i32 1961813231, ; 187: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 112
	i32 1968388702, ; 188: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 53
	i32 1986222447, ; 189: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 76
	i32 2003115576, ; 190: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2011961780, ; 191: System.Buffers.dll => 0x77ec19b4 => 125
	i32 2019465201, ; 192: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 103
	i32 2025202353, ; 193: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2040764568, ; 194: Microsoft.Identity.Client.Extensions.Msal.dll => 0x79a39898 => 70
	i32 2045470958, ; 195: System.Private.Xml => 0x79eb68ee => 170
	i32 2055257422, ; 196: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 102
	i32 2066184531, ; 197: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 198: System.Diagnostics.TraceSource => 0x7b6f419e => 140
	i32 2072397586, ; 199: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 62
	i32 2079903147, ; 200: System.Runtime.dll => 0x7bf8cdab => 179
	i32 2090596640, ; 201: System.Numerics.Vectors => 0x7c9bf920 => 165
	i32 2127167465, ; 202: System.Console => 0x7ec9ffe9 => 135
	i32 2142473426, ; 203: System.Collections.Specialized => 0x7fb38cd2 => 129
	i32 2143790110, ; 204: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 201
	i32 2159891885, ; 205: Microsoft.Maui => 0x80bd55ad => 80
	i32 2169148018, ; 206: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 207: Microsoft.Extensions.Options.dll => 0x820d22b3 => 67
	i32 2192057212, ; 208: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 66
	i32 2192166651, ; 209: Microsoft.AspNetCore.Components.Authorization.dll => 0x82a9cefb => 39
	i32 2193016926, ; 210: System.ObjectModel.dll => 0x82b6c85e => 166
	i32 2201107256, ; 211: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 119
	i32 2201231467, ; 212: System.Net.Http => 0x8334206b => 155
	i32 2207618523, ; 213: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2252897993, ; 214: Microsoft.EntityFrameworkCore => 0x86487ec9 => 47
	i32 2253551641, ; 215: Microsoft.IdentityModel.Protocols => 0x86527819 => 74
	i32 2265110946, ; 216: System.Security.AccessControl.dll => 0x8702d9a2 => 180
	i32 2266594518, ; 217: InstaFood.App => 0x87197cd6 => 122
	i32 2266799131, ; 218: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 54
	i32 2270573516, ; 219: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 220: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 110
	i32 2295906218, ; 221: System.Net.Sockets => 0x88d8bfaa => 162
	i32 2303942373, ; 222: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 223: System.Private.CoreLib.dll => 0x896b7878 => 204
	i32 2340441535, ; 224: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 171
	i32 2353062107, ; 225: System.Net.Primitives => 0x8c40e0db => 158
	i32 2368005991, ; 226: System.Xml.ReaderWriter.dll => 0x8d24e767 => 199
	i32 2369706906, ; 227: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 73
	i32 2371007202, ; 228: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 53
	i32 2383496789, ; 229: System.Security.Principal.Windows.dll => 0x8e114655 => 186
	i32 2395872292, ; 230: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2411328690, ; 231: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 38
	i32 2427813419, ; 232: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 233: System.Console.dll => 0x912896e5 => 135
	i32 2442556106, ; 234: Microsoft.JSInterop.dll => 0x919672ca => 77
	i32 2458678730, ; 235: System.Net.Sockets.dll => 0x928c75ca => 162
	i32 2471841756, ; 236: netstandard.dll => 0x93554fdc => 203
	i32 2475788418, ; 237: Java.Interop.dll => 0x93918882 => 205
	i32 2480646305, ; 238: Microsoft.Maui.Controls => 0x93dba8a1 => 78
	i32 2484371297, ; 239: System.Net.ServicePoint => 0x94147f61 => 161
	i32 2537015816, ; 240: Microsoft.AspNetCore.Authorization => 0x9737ca08 => 37
	i32 2550873716, ; 241: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2562349572, ; 242: Microsoft.CSharp => 0x98ba5a04 => 123
	i32 2570120770, ; 243: System.Text.Encodings.Web => 0x9930ee42 => 189
	i32 2585220780, ; 244: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 188
	i32 2585813321, ; 245: Microsoft.AspNetCore.Components.Forms => 0x9a206149 => 40
	i32 2589602615, ; 246: System.Threading.ThreadPool => 0x9a5a3337 => 195
	i32 2592341985, ; 247: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 59
	i32 2593496499, ; 248: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 249: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 119
	i32 2617129537, ; 250: System.Private.Xml.dll => 0x9bfe3a41 => 170
	i32 2620871830, ; 251: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 97
	i32 2626831493, ; 252: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2628210652, ; 253: System.Memory.Data => 0x9ca74fdc => 86
	i32 2634653062, ; 254: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 49
	i32 2640290731, ; 255: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 73
	i32 2640706905, ; 256: Azure.Core => 0x9d65fd59 => 35
	i32 2660759594, ; 257: System.Security.Cryptography.ProtectedData.dll => 0x9e97f82a => 88
	i32 2663698177, ; 258: System.Runtime.Loader => 0x9ec4cf01 => 173
	i32 2664396074, ; 259: System.Xml.XDocument.dll => 0x9ecf752a => 200
	i32 2665622720, ; 260: System.Drawing.Primitives => 0x9ee22cc0 => 142
	i32 2676780864, ; 261: System.Data.Common.dll => 0x9f8c6f40 => 136
	i32 2677098746, ; 262: Azure.Identity.dll => 0x9f9148fa => 36
	i32 2686887180, ; 263: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 178
	i32 2692077919, ; 264: Microsoft.AspNetCore.Components.WebView.dll => 0xa075d95f => 42
	i32 2717744543, ; 265: System.Security.Claims => 0xa1fd7d9f => 181
	i32 2724373263, ; 266: System.Runtime.Numerics.dll => 0xa262a30f => 174
	i32 2732626843, ; 267: Xamarin.AndroidX.Activity => 0xa2e0939b => 89
	i32 2735172069, ; 268: System.Threading.Channels => 0xa30769e5 => 192
	i32 2735631878, ; 269: Microsoft.AspNetCore.Authorization.dll => 0xa30e6e06 => 37
	i32 2737747696, ; 270: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 91
	i32 2740051746, ; 271: Microsoft.Identity.Client => 0xa351df22 => 69
	i32 2752995522, ; 272: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2755098380, ; 273: Microsoft.SqlServer.Server.dll => 0xa437770c => 83
	i32 2755643133, ; 274: Microsoft.EntityFrameworkCore.SqlServer => 0xa43fc6fd => 50
	i32 2758225723, ; 275: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 79
	i32 2764765095, ; 276: Microsoft.Maui.dll => 0xa4caf7a7 => 80
	i32 2765824710, ; 277: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 187
	i32 2778768386, ; 278: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 114
	i32 2785988530, ; 279: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 280: Microsoft.Maui.Graphics => 0xa7008e0b => 82
	i32 2806116107, ; 281: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 282: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 95
	i32 2831556043, ; 283: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2833784645, ; 284: Microsoft.AspNetCore.Metadata => 0xa8e81f45 => 44
	i32 2847789619, ; 285: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 49
	i32 2853208004, ; 286: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 114
	i32 2861189240, ; 287: Microsoft.Maui.Essentials => 0xaa8a4878 => 81
	i32 2867946736, ; 288: System.Security.Cryptography.ProtectedData => 0xaaf164f0 => 88
	i32 2892341533, ; 289: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 41
	i32 2909740682, ; 290: System.Private.CoreLib => 0xad6f1e8a => 204
	i32 2911054922, ; 291: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 62
	i32 2916838712, ; 292: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 115
	i32 2919462931, ; 293: System.Numerics.Vectors.dll => 0xae037813 => 165
	i32 2940926066, ; 294: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 139
	i32 2944313911, ; 295: System.Configuration.ConfigurationManager.dll => 0xaf7eaa37 => 84
	i32 2959614098, ; 296: System.ComponentModel.dll => 0xb0682092 => 134
	i32 2968338931, ; 297: System.Security.Principal.Windows => 0xb0ed41f3 => 186
	i32 2972252294, ; 298: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 182
	i32 2978675010, ; 299: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 99
	i32 2987532451, ; 300: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 112
	i32 3012788804, ; 301: System.Configuration.ConfigurationManager => 0xb3938244 => 84
	i32 3020703001, ; 302: Microsoft.Extensions.Diagnostics => 0xb40c4519 => 57
	i32 3033605958, ; 303: System.Memory.Data.dll => 0xb4d12746 => 86
	i32 3038032645, ; 304: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 305: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 106
	i32 3059408633, ; 306: Mono.Android.Runtime => 0xb65adef9 => 206
	i32 3059793426, ; 307: System.ComponentModel.Primitives => 0xb660be12 => 132
	i32 3069363400, ; 308: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 51
	i32 3077302341, ; 309: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3084678329, ; 310: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 76
	i32 3090735792, ; 311: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 184
	i32 3099732863, ; 312: System.Security.Claims.dll => 0xb8c22b7f => 181
	i32 3103600923, ; 313: System.Formats.Asn1 => 0xb8fd311b => 144
	i32 3121463068, ; 314: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 147
	i32 3124832203, ; 315: System.Threading.Tasks.Extensions => 0xba4127cb => 193
	i32 3132293585, ; 316: System.Security.AccessControl => 0xbab301d1 => 180
	i32 3147165239, ; 317: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 141
	i32 3178803400, ; 318: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 107
	i32 3195844289, ; 319: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 51
	i32 3220365878, ; 320: System.Threading => 0xbff2e236 => 196
	i32 3258312781, ; 321: Xamarin.AndroidX.CardView => 0xc235e84d => 93
	i32 3265493905, ; 322: System.Linq.Queryable.dll => 0xc2a37b91 => 151
	i32 3265893370, ; 323: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 193
	i32 3280506390, ; 324: System.ComponentModel.Annotations.dll => 0xc3888e16 => 131
	i32 3301621068, ; 325: InstaFood.DataAccess.dll => 0xc4cabd4c => 120
	i32 3305363605, ; 326: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3312457198, ; 327: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 72
	i32 3316684772, ; 328: System.Net.Requests.dll => 0xc5b097e4 => 159
	i32 3317135071, ; 329: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 98
	i32 3327360333, ; 330: InstaFood.App.dll => 0xc6537d4d => 122
	i32 3346324047, ; 331: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 108
	i32 3357674450, ; 332: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 333: System.Text.Json => 0xc82afec1 => 190
	i32 3362522851, ; 334: Xamarin.AndroidX.Core => 0xc86c06e3 => 96
	i32 3366347497, ; 335: Java.Interop => 0xc8a662e9 => 205
	i32 3374879918, ; 336: Microsoft.IdentityModel.Protocols.dll => 0xc92894ae => 74
	i32 3374999561, ; 337: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 110
	i32 3381016424, ; 338: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3406629867, ; 339: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 60
	i32 3428513518, ; 340: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 55
	i32 3430777524, ; 341: netstandard => 0xcc7d82b4 => 203
	i32 3463511458, ; 342: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3464190856, ; 343: Microsoft.AspNetCore.Components.Forms.dll => 0xce7b5b88 => 40
	i32 3471940407, ; 344: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 133
	i32 3476120550, ; 345: Mono.Android => 0xcf3163e6 => 207
	i32 3479583265, ; 346: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 347: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 348: System.Text.Json.dll => 0xcfbaacae => 190
	i32 3500000672, ; 349: Microsoft.JSInterop => 0xd09dc5a0 => 77
	i32 3509114376, ; 350: System.Xml.Linq => 0xd128d608 => 198
	i32 3545306353, ; 351: Microsoft.Data.SqlClient => 0xd35114f1 => 46
	i32 3561949811, ; 352: Azure.Core.dll => 0xd44f0a73 => 35
	i32 3570554715, ; 353: System.IO.FileSystem.AccessControl => 0xd4d2575b => 147
	i32 3570608287, ; 354: System.Runtime.Caching.dll => 0xd4d3289f => 87
	i32 3580758918, ; 355: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 356: System.Linq.dll => 0xd715a361 => 152
	i32 3624195450, ; 357: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 171
	i32 3641597786, ; 358: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 102
	i32 3643446276, ; 359: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 360: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 107
	i32 3657292374, ; 361: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 54
	i32 3660523487, ; 362: System.Net.NetworkInformation => 0xda2f27df => 157
	i32 3672681054, ; 363: Mono.Android.dll => 0xdae8aa5e => 207
	i32 3682565725, ; 364: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 92
	i32 3697841164, ; 365: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3700591436, ; 366: Microsoft.IdentityModel.Abstractions.dll => 0xdc928b4c => 71
	i32 3724971120, ; 367: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 106
	i32 3732100267, ; 368: System.Net.NameResolution => 0xde7354ab => 156
	i32 3732214720, ; 369: Microsoft.AspNetCore.Metadata.dll => 0xde7513c0 => 44
	i32 3737834244, ; 370: System.Net.Http.Json.dll => 0xdecad304 => 154
	i32 3748608112, ; 371: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 137
	i32 3786282454, ; 372: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 94
	i32 3792276235, ; 373: System.Collections.NonGeneric => 0xe2098b0b => 128
	i32 3802395368, ; 374: System.Collections.Specialized.dll => 0xe2a3f2e8 => 129
	i32 3823082795, ; 375: System.Security.Cryptography.dll => 0xe3df9d2b => 185
	i32 3841636137, ; 376: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 56
	i32 3849253459, ; 377: System.Runtime.InteropServices.dll => 0xe56ef253 => 172
	i32 3885497537, ; 378: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 164
	i32 3889960447, ; 379: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 380: System.Collections.Concurrent.dll => 0xe839deed => 126
	i32 3896760992, ; 381: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 96
	i32 3928044579, ; 382: System.Xml.ReaderWriter => 0xea213423 => 199
	i32 3931092270, ; 383: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 109
	i32 3953953790, ; 384: System.Text.Encoding.CodePages => 0xebac8bfe => 187
	i32 3955647286, ; 385: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 90
	i32 3962306622, ; 386: InstaFood.DataAccess => 0xec2c003e => 120
	i32 3980434154, ; 387: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 388: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4003436829, ; 389: System.Diagnostics.Process.dll => 0xee9f991d => 138
	i32 4025784931, ; 390: System.Memory => 0xeff49a63 => 153
	i32 4046471985, ; 391: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 79
	i32 4068434129, ; 392: System.Private.Xml.Linq.dll => 0xf27f60d1 => 169
	i32 4073602200, ; 393: System.Threading.dll => 0xf2ce3c98 => 196
	i32 4094352644, ; 394: Microsoft.Maui.Essentials.dll => 0xf40add04 => 81
	i32 4099507663, ; 395: System.Drawing.dll => 0xf45985cf => 143
	i32 4100113165, ; 396: System.Private.Uri => 0xf462c30d => 168
	i32 4101842092, ; 397: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 52
	i32 4102112229, ; 398: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 399: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 400: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 55
	i32 4127667938, ; 401: System.IO.FileSystem.Watcher => 0xf60736e2 => 148
	i32 4150914736, ; 402: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4159265925, ; 403: System.Xml.XmlSerializer => 0xf7e95c85 => 201
	i32 4164802419, ; 404: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 148
	i32 4181436372, ; 405: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 177
	i32 4182413190, ; 406: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 104
	i32 4194278001, ; 407: Microsoft.EntityFrameworkCore.SqlServer.dll => 0xf9ff9a71 => 50
	i32 4196529839, ; 408: System.Net.WebClient.dll => 0xfa21f6af => 163
	i32 4213026141, ; 409: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 137
	i32 4260525087, ; 410: System.Buffers => 0xfdf2741f => 125
	i32 4263231520, ; 411: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 85
	i32 4271975918, ; 412: Microsoft.Maui.Controls.dll => 0xfea12dee => 78
	i32 4274976490, ; 413: System.Runtime.Numerics => 0xfecef6ea => 174
	i32 4292120959, ; 414: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 104
	i32 4294648842 ; 415: Microsoft.Extensions.FileProviders.Embedded => 0xfffb240a => 61
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [416 x i32] [
	i32 157, ; 0
	i32 156, ; 1
	i32 194, ; 2
	i32 139, ; 3
	i32 33, ; 4
	i32 183, ; 5
	i32 82, ; 6
	i32 58, ; 7
	i32 172, ; 8
	i32 192, ; 9
	i32 164, ; 10
	i32 183, ; 11
	i32 131, ; 12
	i32 94, ; 13
	i32 113, ; 14
	i32 30, ; 15
	i32 31, ; 16
	i32 134, ; 17
	i32 92, ; 18
	i32 57, ; 19
	i32 123, ; 20
	i32 39, ; 21
	i32 38, ; 22
	i32 2, ; 23
	i32 64, ; 24
	i32 30, ; 25
	i32 89, ; 26
	i32 83, ; 27
	i32 15, ; 28
	i32 101, ; 29
	i32 14, ; 30
	i32 149, ; 31
	i32 197, ; 32
	i32 161, ; 33
	i32 194, ; 34
	i32 153, ; 35
	i32 195, ; 36
	i32 34, ; 37
	i32 26, ; 38
	i32 130, ; 39
	i32 100, ; 40
	i32 184, ; 41
	i32 177, ; 42
	i32 202, ; 43
	i32 71, ; 44
	i32 166, ; 45
	i32 13, ; 46
	i32 7, ; 47
	i32 68, ; 48
	i32 151, ; 49
	i32 65, ; 50
	i32 178, ; 51
	i32 45, ; 52
	i32 61, ; 53
	i32 21, ; 54
	i32 182, ; 55
	i32 98, ; 56
	i32 19, ; 57
	i32 189, ; 58
	i32 126, ; 59
	i32 160, ; 60
	i32 1, ; 61
	i32 198, ; 62
	i32 16, ; 63
	i32 4, ; 64
	i32 173, ; 65
	i32 159, ; 66
	i32 149, ; 67
	i32 146, ; 68
	i32 25, ; 69
	i32 67, ; 70
	i32 43, ; 71
	i32 136, ; 72
	i32 168, ; 73
	i32 145, ; 74
	i32 154, ; 75
	i32 132, ; 76
	i32 28, ; 77
	i32 117, ; 78
	i32 101, ; 79
	i32 141, ; 80
	i32 200, ; 81
	i32 167, ; 82
	i32 130, ; 83
	i32 63, ; 84
	i32 111, ; 85
	i32 143, ; 86
	i32 56, ; 87
	i32 3, ; 88
	i32 90, ; 89
	i32 142, ; 90
	i32 121, ; 91
	i32 150, ; 92
	i32 58, ; 93
	i32 103, ; 94
	i32 70, ; 95
	i32 133, ; 96
	i32 118, ; 97
	i32 202, ; 98
	i32 16, ; 99
	i32 46, ; 100
	i32 48, ; 101
	i32 22, ; 102
	i32 59, ; 103
	i32 108, ; 104
	i32 48, ; 105
	i32 20, ; 106
	i32 52, ; 107
	i32 138, ; 108
	i32 18, ; 109
	i32 2, ; 110
	i32 99, ; 111
	i32 167, ; 112
	i32 152, ; 113
	i32 176, ; 114
	i32 32, ; 115
	i32 111, ; 116
	i32 95, ; 117
	i32 175, ; 118
	i32 0, ; 119
	i32 117, ; 120
	i32 144, ; 121
	i32 60, ; 122
	i32 160, ; 123
	i32 85, ; 124
	i32 6, ; 125
	i32 127, ; 126
	i32 146, ; 127
	i32 91, ; 128
	i32 68, ; 129
	i32 127, ; 130
	i32 145, ; 131
	i32 124, ; 132
	i32 10, ; 133
	i32 72, ; 134
	i32 64, ; 135
	i32 5, ; 136
	i32 63, ; 137
	i32 191, ; 138
	i32 43, ; 139
	i32 25, ; 140
	i32 87, ; 141
	i32 176, ; 142
	i32 36, ; 143
	i32 163, ; 144
	i32 105, ; 145
	i32 115, ; 146
	i32 75, ; 147
	i32 97, ; 148
	i32 155, ; 149
	i32 191, ; 150
	i32 42, ; 151
	i32 179, ; 152
	i32 116, ; 153
	i32 158, ; 154
	i32 185, ; 155
	i32 47, ; 156
	i32 93, ; 157
	i32 23, ; 158
	i32 1, ; 159
	i32 197, ; 160
	i32 124, ; 161
	i32 41, ; 162
	i32 140, ; 163
	i32 113, ; 164
	i32 65, ; 165
	i32 206, ; 166
	i32 17, ; 167
	i32 100, ; 168
	i32 9, ; 169
	i32 69, ; 170
	i32 45, ; 171
	i32 121, ; 172
	i32 105, ; 173
	i32 118, ; 174
	i32 116, ; 175
	i32 109, ; 176
	i32 188, ; 177
	i32 175, ; 178
	i32 66, ; 179
	i32 29, ; 180
	i32 26, ; 181
	i32 150, ; 182
	i32 75, ; 183
	i32 8, ; 184
	i32 128, ; 185
	i32 169, ; 186
	i32 112, ; 187
	i32 53, ; 188
	i32 76, ; 189
	i32 5, ; 190
	i32 125, ; 191
	i32 103, ; 192
	i32 0, ; 193
	i32 70, ; 194
	i32 170, ; 195
	i32 102, ; 196
	i32 4, ; 197
	i32 140, ; 198
	i32 62, ; 199
	i32 179, ; 200
	i32 165, ; 201
	i32 135, ; 202
	i32 129, ; 203
	i32 201, ; 204
	i32 80, ; 205
	i32 12, ; 206
	i32 67, ; 207
	i32 66, ; 208
	i32 39, ; 209
	i32 166, ; 210
	i32 119, ; 211
	i32 155, ; 212
	i32 14, ; 213
	i32 47, ; 214
	i32 74, ; 215
	i32 180, ; 216
	i32 122, ; 217
	i32 54, ; 218
	i32 8, ; 219
	i32 110, ; 220
	i32 162, ; 221
	i32 18, ; 222
	i32 204, ; 223
	i32 171, ; 224
	i32 158, ; 225
	i32 199, ; 226
	i32 73, ; 227
	i32 53, ; 228
	i32 186, ; 229
	i32 13, ; 230
	i32 38, ; 231
	i32 10, ; 232
	i32 135, ; 233
	i32 77, ; 234
	i32 162, ; 235
	i32 203, ; 236
	i32 205, ; 237
	i32 78, ; 238
	i32 161, ; 239
	i32 37, ; 240
	i32 11, ; 241
	i32 123, ; 242
	i32 189, ; 243
	i32 188, ; 244
	i32 40, ; 245
	i32 195, ; 246
	i32 59, ; 247
	i32 20, ; 248
	i32 119, ; 249
	i32 170, ; 250
	i32 97, ; 251
	i32 15, ; 252
	i32 86, ; 253
	i32 49, ; 254
	i32 73, ; 255
	i32 35, ; 256
	i32 88, ; 257
	i32 173, ; 258
	i32 200, ; 259
	i32 142, ; 260
	i32 136, ; 261
	i32 36, ; 262
	i32 178, ; 263
	i32 42, ; 264
	i32 181, ; 265
	i32 174, ; 266
	i32 89, ; 267
	i32 192, ; 268
	i32 37, ; 269
	i32 91, ; 270
	i32 69, ; 271
	i32 21, ; 272
	i32 83, ; 273
	i32 50, ; 274
	i32 79, ; 275
	i32 80, ; 276
	i32 187, ; 277
	i32 114, ; 278
	i32 27, ; 279
	i32 82, ; 280
	i32 6, ; 281
	i32 95, ; 282
	i32 19, ; 283
	i32 44, ; 284
	i32 49, ; 285
	i32 114, ; 286
	i32 81, ; 287
	i32 88, ; 288
	i32 41, ; 289
	i32 204, ; 290
	i32 62, ; 291
	i32 115, ; 292
	i32 165, ; 293
	i32 139, ; 294
	i32 84, ; 295
	i32 134, ; 296
	i32 186, ; 297
	i32 182, ; 298
	i32 99, ; 299
	i32 112, ; 300
	i32 84, ; 301
	i32 57, ; 302
	i32 86, ; 303
	i32 34, ; 304
	i32 106, ; 305
	i32 206, ; 306
	i32 132, ; 307
	i32 51, ; 308
	i32 12, ; 309
	i32 76, ; 310
	i32 184, ; 311
	i32 181, ; 312
	i32 144, ; 313
	i32 147, ; 314
	i32 193, ; 315
	i32 180, ; 316
	i32 141, ; 317
	i32 107, ; 318
	i32 51, ; 319
	i32 196, ; 320
	i32 93, ; 321
	i32 151, ; 322
	i32 193, ; 323
	i32 131, ; 324
	i32 120, ; 325
	i32 7, ; 326
	i32 72, ; 327
	i32 159, ; 328
	i32 98, ; 329
	i32 122, ; 330
	i32 108, ; 331
	i32 24, ; 332
	i32 190, ; 333
	i32 96, ; 334
	i32 205, ; 335
	i32 74, ; 336
	i32 110, ; 337
	i32 3, ; 338
	i32 60, ; 339
	i32 55, ; 340
	i32 203, ; 341
	i32 11, ; 342
	i32 40, ; 343
	i32 133, ; 344
	i32 207, ; 345
	i32 24, ; 346
	i32 23, ; 347
	i32 190, ; 348
	i32 77, ; 349
	i32 198, ; 350
	i32 46, ; 351
	i32 35, ; 352
	i32 147, ; 353
	i32 87, ; 354
	i32 31, ; 355
	i32 152, ; 356
	i32 171, ; 357
	i32 102, ; 358
	i32 28, ; 359
	i32 107, ; 360
	i32 54, ; 361
	i32 157, ; 362
	i32 207, ; 363
	i32 92, ; 364
	i32 33, ; 365
	i32 71, ; 366
	i32 106, ; 367
	i32 156, ; 368
	i32 44, ; 369
	i32 154, ; 370
	i32 137, ; 371
	i32 94, ; 372
	i32 128, ; 373
	i32 129, ; 374
	i32 185, ; 375
	i32 56, ; 376
	i32 172, ; 377
	i32 164, ; 378
	i32 32, ; 379
	i32 126, ; 380
	i32 96, ; 381
	i32 199, ; 382
	i32 109, ; 383
	i32 187, ; 384
	i32 90, ; 385
	i32 120, ; 386
	i32 27, ; 387
	i32 9, ; 388
	i32 138, ; 389
	i32 153, ; 390
	i32 79, ; 391
	i32 169, ; 392
	i32 196, ; 393
	i32 81, ; 394
	i32 143, ; 395
	i32 168, ; 396
	i32 52, ; 397
	i32 22, ; 398
	i32 17, ; 399
	i32 55, ; 400
	i32 148, ; 401
	i32 29, ; 402
	i32 201, ; 403
	i32 148, ; 404
	i32 177, ; 405
	i32 104, ; 406
	i32 50, ; 407
	i32 163, ; 408
	i32 137, ; 409
	i32 125, ; 410
	i32 85, ; 411
	i32 78, ; 412
	i32 174, ; 413
	i32 104, ; 414
	i32 61 ; 415
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
