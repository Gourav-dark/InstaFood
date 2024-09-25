; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [228 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [456 x i64] [
	i64 98382396393917666, ; 0: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 70
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 227
	i64 131669012237370309, ; 2: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 83
	i64 196720943101637631, ; 3: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 162
	i64 210515253464952879, ; 4: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 104
	i64 232391251801502327, ; 5: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 121
	i64 435118502366263740, ; 6: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 122
	i64 545109961164950392, ; 7: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 7
	i64 560278790331054453, ; 8: System.Reflection.Primitives => 0x7c6829760de3975 => 186
	i64 670564002081277297, ; 9: Microsoft.Identity.Client.dll => 0x94e526837380571 => 71
	i64 683390398661839228, ; 10: Microsoft.Extensions.FileProviders.Embedded => 0x97be3f26326c97c => 63
	i64 737318085524959015, ; 11: NuGet.Frameworks => 0xa3b7ae46e2faf27 => 89
	i64 750875890346172408, ; 12: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 213
	i64 799765834175365804, ; 13: System.ComponentModel.dll => 0xb1956c9f18442ac => 144
	i64 849051935479314978, ; 14: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 10
	i64 872800313462103108, ; 15: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 109
	i64 937459790420187032, ; 16: Microsoft.SqlServer.Server.dll => 0xd0286b667351798 => 85
	i64 1010599046655515943, ; 17: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 186
	i64 1060858978308751610, ; 18: Azure.Core.dll => 0xeb8ed9ebee080fa => 35
	i64 1120440138749646132, ; 19: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 126
	i64 1121665720830085036, ; 20: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 18
	i64 1187046477634397607, ; 21: InstaFood.PhoneApp => 0x10793c7b6f46e5a7 => 132
	i64 1268860745194512059, ; 22: System.Drawing.dll => 0x119be62002c19ebb => 153
	i64 1278906455852160409, ; 23: Microsoft.EntityFrameworkCore.SqlServer.dll => 0x11bf96a54a059599 => 52
	i64 1369545283391376210, ; 24: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 117
	i64 1404195534211153682, ; 25: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 158
	i64 1476839205573959279, ; 26: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 171
	i64 1486715745332614827, ; 27: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 80
	i64 1513467482682125403, ; 28: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 226
	i64 1537168428375924959, ; 29: System.Threading.Thread.dll => 0x15551e8a954ae0df => 213
	i64 1556147632182429976, ; 30: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 16
	i64 1580831035586038082, ; 31: NuGet.Versioning.dll => 0x15f03d738604c942 => 92
	i64 1624659445732251991, ; 32: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 101
	i64 1628611045998245443, ; 33: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 114
	i64 1731380447121279447, ; 34: Newtonsoft.Json => 0x18071957e9b889d7 => 86
	i64 1743969030606105336, ; 35: System.Memory.dll => 0x1833d297e88f2af8 => 166
	i64 1767386781656293639, ; 36: System.Private.Uri.dll => 0x188704e9f5582107 => 181
	i64 1776954265264967804, ; 37: Microsoft.JSInterop.dll => 0x18a9027d533bd07c => 79
	i64 1795316252682057001, ; 38: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 100
	i64 1825687700144851180, ; 39: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 188
	i64 1835311033149317475, ; 40: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 41: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 121
	i64 1854145951182283680, ; 42: System.Runtime.CompilerServices.VisualC => 0x19bb3feb3df2e3a0 => 187
	i64 1865037103900624886, ; 43: Microsoft.Bcl.AsyncInterfaces => 0x19e1f15d56eb87f6 => 47
	i64 1875417405349196092, ; 44: System.Drawing.Primitives => 0x1a06d2319b6c713c => 152
	i64 1881198190668717030, ; 45: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1897575647115118287, ; 46: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 122
	i64 1920760634179481754, ; 47: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 81
	i64 1959996714666907089, ; 48: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 28
	i64 1972385128188460614, ; 49: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 199
	i64 1981742497975770890, ; 50: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 113
	i64 1983698669889758782, ; 51: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 2
	i64 2019660174692588140, ; 52: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 20
	i64 2040001226662520565, ; 53: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 212
	i64 2080945842184875448, ; 54: System.IO.MemoryMappedFiles => 0x1ce10137d8416db8 => 160
	i64 2102659300918482391, ; 55: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 152
	i64 2133195048986300728, ; 56: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 86
	i64 2165725771938924357, ; 57: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 102
	i64 2192948757939169934, ; 58: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x1e6eeb46cf992a8e => 50
	i64 2262844636196693701, ; 59: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 109
	i64 2287834202362508563, ; 60: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 136
	i64 2295368378960711535, ; 61: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x1fdac961189e0f6f => 45
	i64 2302323944321350744, ; 62: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 24
	i64 2315304989185124968, ; 63: System.IO.FileSystem.dll => 0x20219d9ee311aa68 => 159
	i64 2316229908869312383, ; 64: Microsoft.IdentityModel.Protocols.OpenIdConnect => 0x2024e6d4884a6f7f => 77
	i64 2329709569556905518, ; 65: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 112
	i64 2335503487726329082, ; 66: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 208
	i64 2455121377850707897, ; 67: NuGet.Frameworks.dll => 0x221257e2a7424fb9 => 89
	i64 2470498323731680442, ; 68: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 105
	i64 2497223385847772520, ; 69: System.Runtime => 0x22a7eb7046413568 => 196
	i64 2547086958574651984, ; 70: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 99
	i64 2554797818648757682, ; 71: System.Runtime.Caching.dll => 0x23747714858085b2 => 96
	i64 2602673633151553063, ; 72: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2612152650457191105, ; 73: Microsoft.IdentityModel.Tokens.dll => 0x24403afeed9892c1 => 78
	i64 2624866290265602282, ; 74: mscorlib.dll => 0x246d65fbde2db8ea => 222
	i64 2632269733008246987, ; 75: System.Net.NameResolution => 0x2487b36034f808cb => 169
	i64 2656907746661064104, ; 76: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 57
	i64 2662981627730767622, ; 77: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2781169761569919449, ; 78: Microsoft.JSInterop => 0x2698b329b26ed1d9 => 79
	i64 2789714023057451704, ; 79: Microsoft.IdentityModel.JsonWebTokens.dll => 0x26b70e1f9943eab8 => 74
	i64 2815524396660695947, ; 80: System.Security.AccessControl => 0x2712c0857f68238b => 197
	i64 2851879596360956261, ; 81: System.Configuration.ConfigurationManager => 0x2793e9620b477965 => 93
	i64 2895129759130297543, ; 82: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 3017704767998173186, ; 83: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 126
	i64 3106852385031680087, ; 84: System.Runtime.Serialization.Xml => 0x2b1dc1c88b637057 => 195
	i64 3266690593535380875, ; 85: Microsoft.AspNetCore.Authorization => 0x2d559dc982c94d8b => 39
	i64 3289520064315143713, ; 86: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 111
	i64 3311221304742556517, ; 87: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 178
	i64 3325875462027654285, ; 88: System.Runtime.Numerics => 0x2e27e21c8958b48d => 191
	i64 3328853167529574890, ; 89: System.Net.Sockets.dll => 0x2e327651a008c1ea => 175
	i64 3344514922410554693, ; 90: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 129
	i64 3396143930648122816, ; 91: Microsoft.Extensions.FileProviders.Abstractions => 0x2f2186e9506155c0 => 61
	i64 3402534845034375023, ; 92: System.IdentityModel.Tokens.Jwt.dll => 0x2f383b6a0629a76f => 94
	i64 3429672777697402584, ; 93: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 83
	i64 3437845325506641314, ; 94: System.IO.MemoryMappedFiles.dll => 0x2fb5ae1beb8f7da2 => 160
	i64 3494946837667399002, ; 95: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 55
	i64 3522470458906976663, ; 96: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 123
	i64 3523004241079211829, ; 97: Microsoft.Extensions.Caching.Memory.dll => 0x30e439b10bb89735 => 54
	i64 3536216251757907477, ; 98: BlazorBootstrap.dll => 0x311329f1fefe4e15 => 37
	i64 3551103847008531295, ; 99: System.Private.CoreLib.dll => 0x31480e226177735f => 224
	i64 3567343442040498961, ; 100: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 101: System.Runtime.dll => 0x319037675df7e556 => 196
	i64 3638003163729360188, ; 102: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 56
	i64 3647754201059316852, ; 103: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 218
	i64 3655542548057982301, ; 104: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 55
	i64 3716579019761409177, ; 105: netstandard.dll => 0x3393f0ed5c8c5c99 => 223
	i64 3727469159507183293, ; 106: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 120
	i64 3753897248517198740, ; 107: Microsoft.AspNetCore.Components.WebView.dll => 0x341885a8952f1394 => 44
	i64 3794322307918838949, ; 108: Microsoft.AspNetCore.Metadata.dll => 0x34a824092ed7bca5 => 46
	i64 3869221888984012293, ; 109: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 67
	i64 3889433610606858880, ; 110: Microsoft.Extensions.FileProviders.Physical.dll => 0x35fa0b4301afd280 => 64
	i64 3890352374528606784, ; 111: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 81
	i64 3919223565570527920, ; 112: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 201
	i64 3933965368022646939, ; 113: System.Net.Requests => 0x369840a8bfadc09b => 172
	i64 3966267475168208030, ; 114: System.Memory => 0x370b03412596249e => 166
	i64 4009997192427317104, ; 115: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 194
	i64 4073500526318903918, ; 116: System.Private.Xml.dll => 0x3887fb25779ae26e => 183
	i64 4120493066591692148, ; 117: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4154383907710350974, ; 118: System.ComponentModel => 0x39a7562737acb67e => 144
	i64 4167269041631776580, ; 119: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 214
	i64 4168469861834746866, ; 120: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 198
	i64 4187479170553454871, ; 121: System.Linq.Expressions => 0x3a1cea1e912fa117 => 162
	i64 4205801962323029395, ; 122: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 143
	i64 4356591372459378815, ; 123: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 30
	i64 4373617458794931033, ; 124: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 161
	i64 4384840217421645357, ; 125: Microsoft.AspNetCore.Components.Forms => 0x3cda14f22443862d => 42
	i64 4513320955448359355, ; 126: Microsoft.EntityFrameworkCore.Relational => 0x3ea2897f12d379bb => 51
	i64 4612482779465751747, ; 127: Microsoft.EntityFrameworkCore.Abstractions => 0x4002d4a662a99cc3 => 50
	i64 4657212095206026001, ; 128: Microsoft.Extensions.Http.dll => 0x40a1bdb9c2686b11 => 66
	i64 4672453897036726049, ; 129: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 158
	i64 4679594760078841447, ; 130: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 0
	i64 4716677666592453464, ; 131: System.Xml.XmlSerializer => 0x417501590542f358 => 220
	i64 4743821336939966868, ; 132: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 141
	i64 4794310189461587505, ; 133: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 99
	i64 4795410492532947900, ; 134: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 123
	i64 4809057822547766521, ; 135: System.Drawing => 0x42bd349c3145ecf9 => 153
	i64 4814660307502931973, ; 136: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 169
	i64 4853321196694829351, ; 137: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 190
	i64 5103417709280584325, ; 138: System.Collections.Specialized => 0x46d2fb5e161b6285 => 139
	i64 5182934613077526976, ; 139: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 139
	i64 5197073077358930460, ; 140: Microsoft.AspNetCore.Components.Web.dll => 0x481fb66db7b9aa1c => 43
	i64 5278787618751394462, ; 141: System.Net.WebClient.dll => 0x4942055efc68329e => 176
	i64 5290786973231294105, ; 142: System.Runtime.Loader => 0x496ca6b869b72699 => 190
	i64 5423376490970181369, ; 143: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 188
	i64 5471532531798518949, ; 144: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5478493157351955748, ; 145: NuGet.Protocol.dll => 0x4c078480145f1d24 => 91
	i64 5511405180409758881, ; 146: ChilkatDotNet46.dll => 0x4c7c71cf979244a1 => 38
	i64 5522859530602327440, ; 147: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5570799893513421663, ; 148: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 155
	i64 5573260873512690141, ; 149: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 204
	i64 5591791169662171124, ; 150: System.Linq.Parallel => 0x4d9a087135e137f4 => 163
	i64 5650097808083101034, ; 151: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 199
	i64 5692067934154308417, ; 152: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 125
	i64 5717718751406333486, ; 153: NuGet.Configuration => 0x4f596ae91f2a1e2e => 88
	i64 5979151488806146654, ; 154: System.Formats.Asn1 => 0x52fa3699a489d25e => 154
	i64 5984759512290286505, ; 155: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 202
	i64 6010974535988770325, ; 156: Microsoft.Extensions.Diagnostics.dll => 0x536b457e33877615 => 59
	i64 6068057819846744445, ; 157: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 23
	i64 6171817345414361534, ; 158: InstaFood.DataAccess => 0x55a6b32d0c0471be => 130
	i64 6182525717148725503, ; 159: Microsoft.AspNetCore.Components.Authorization => 0x55ccbe62215df0ff => 41
	i64 6200764641006662125, ; 160: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6222399776351216807, ; 161: System.Text.Json.dll => 0x565a67a0ffe264a7 => 209
	i64 6251069312384999852, ; 162: System.Transactions.Local => 0x56c0426b870da1ac => 216
	i64 6278736998281604212, ; 163: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 180
	i64 6284145129771520194, ; 164: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 184
	i64 6357457916754632952, ; 165: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6362365112271840035, ; 166: NuGet.Protocol => 0x584ba95c404d2323 => 91
	i64 6401687960814735282, ; 167: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 112
	i64 6478287442656530074, ; 168: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6504860066809920875, ; 169: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 102
	i64 6548213210057960872, ; 170: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 108
	i64 6560151584539558821, ; 171: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 69
	i64 6584419190991186517, ; 172: NuGet.Versioning => 0x5b608e5e534b6a55 => 92
	i64 6592629841836844929, ; 173: InstaFood.DataAccess.dll => 0x5b7db9e972532781 => 130
	i64 6617685658146568858, ; 174: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 206
	i64 6743165466166707109, ; 175: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6777482997383978746, ; 176: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 22
	i64 6786606130239981554, ; 177: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 150
	i64 6814185388980153342, ; 178: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 219
	i64 6876862101832370452, ; 179: System.Xml.Linq => 0x5f6f85a57d108914 => 217
	i64 6894844156784520562, ; 180: System.Numerics.Vectors => 0x5faf683aead1ad72 => 178
	i64 6920570528939222495, ; 181: Microsoft.AspNetCore.Components.WebView => 0x600ace3ab475a5df => 44
	i64 7083547580668757502, ; 182: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 182
	i64 7105430439328552570, ; 183: System.Security.Cryptography.Pkcs => 0x629b8f56a06d167a => 97
	i64 7112547816752919026, ; 184: System.IO.FileSystem => 0x62b4d88e3189b1f2 => 159
	i64 7148515934569711863, ; 185: NuGet.Packaging.dll => 0x6334a15e373f48f7 => 90
	i64 7220009545223068405, ; 186: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 26
	i64 7270811800166795866, ; 187: System.Linq => 0x64e71ccf51a90a5a => 165
	i64 7316205155833392065, ; 188: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 134
	i64 7348123982286201829, ; 189: System.Memory.Data.dll => 0x65f9c7d471b2a3e5 => 95
	i64 7377312882064240630, ; 190: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 143
	i64 7488575175965059935, ; 191: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 217
	i64 7489048572193775167, ; 192: System.ObjectModel => 0x67ee71ff6b419e3f => 179
	i64 7496222613193209122, ; 193: System.IdentityModel.Tokens.Jwt => 0x6807eec000a1b522 => 94
	i64 7592577537120840276, ; 194: System.Diagnostics.Process => 0x695e410af5b2aa54 => 148
	i64 7654504624184590948, ; 195: System.Net.Http => 0x6a3a4366801b8264 => 168
	i64 7708790323521193081, ; 196: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 17
	i64 7714652370974252055, ; 197: System.Private.CoreLib => 0x6b0ff375198b9c17 => 224
	i64 7735176074855944702, ; 198: Microsoft.CSharp => 0x6b58dda848e391fe => 133
	i64 7735352534559001595, ; 199: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 128
	i64 7791074099216502080, ; 200: System.IO.FileSystem.AccessControl.dll => 0x6c1f749d468bcd40 => 157
	i64 7836164640616011524, ; 201: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 101
	i64 7919757340696389605, ; 202: Microsoft.Extensions.Diagnostics.Abstractions => 0x6de8a157378027e5 => 60
	i64 7972383140441761405, ; 203: Microsoft.Extensions.Caching.Abstractions.dll => 0x6ea3983a0b58267d => 53
	i64 8014722069583580780, ; 204: Microsoft.AspNetCore.Components.Forms.dll => 0x6f3a03422b034e6c => 42
	i64 8064050204834738623, ; 205: System.Collections.dll => 0x6fe942efa61731bf => 140
	i64 8083354569033831015, ; 206: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 111
	i64 8085230611270010360, ; 207: System.Net.Http.Json.dll => 0x703482674fdd05f8 => 167
	i64 8087206902342787202, ; 208: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 147
	i64 8167236081217502503, ; 209: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 225
	i64 8185542183669246576, ; 210: System.Collections => 0x7198e33f4794aa70 => 140
	i64 8234598844743906698, ; 211: Microsoft.Identity.Client.Extensions.Msal.dll => 0x72472c0540cd758a => 72
	i64 8246048515196606205, ; 212: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 84
	i64 8264926008854159966, ; 213: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 148
	i64 8368701292315763008, ; 214: System.Security.Cryptography => 0x7423997c6fd56140 => 204
	i64 8400357532724379117, ; 215: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 119
	i64 8410671156615598628, ; 216: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 185
	i64 8412848207705863092, ; 217: InstaFood.Shared.dll => 0x74c070df2996f3b4 => 131
	i64 8490820071440741817, ; 218: NuGet.Packaging => 0x75d573de61fb75b9 => 90
	i64 8513291706828295435, ; 219: Microsoft.SqlServer.Server => 0x762549b3b6c78d0b => 85
	i64 8518412311883997971, ; 220: System.Collections.Immutable => 0x76377add7c28e313 => 137
	i64 8563666267364444763, ; 221: System.Private.Uri => 0x76d841191140ca5b => 181
	i64 8614108721271900878, ; 222: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 21
	i64 8626175481042262068, ; 223: Java.Interop => 0x77b654e585b55834 => 225
	i64 8638972117149407195, ; 224: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 133
	i64 8639588376636138208, ; 225: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 118
	i64 8677882282824630478, ; 226: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8725526185868997716, ; 227: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 147
	i64 8816904670177563593, ; 228: Microsoft.Extensions.Diagnostics => 0x7a5bf015646a93c9 => 59
	i64 8941376889969657626, ; 229: System.Xml.XDocument => 0x7c1626e87187471a => 219
	i64 8954753533646919997, ; 230: System.Runtime.Serialization.Json => 0x7c45ace50032d93d => 193
	i64 8955323522379913726, ; 231: Microsoft.Identity.Client => 0x7c47b34bd82799fe => 71
	i64 9045785047181495996, ; 232: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9052662452269567435, ; 233: Microsoft.IdentityModel.Protocols => 0x7da184898b0b4dcb => 76
	i64 9111603110219107042, ; 234: Microsoft.Extensions.Caching.Memory => 0x7e72eac0def44ae2 => 54
	i64 9250544137016314866, ; 235: Microsoft.EntityFrameworkCore => 0x806088e191ee0bf2 => 49
	i64 9312692141327339315, ; 236: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 125
	i64 9324707631942237306, ; 237: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 100
	i64 9427266486299436557, ; 238: Microsoft.IdentityModel.Logging.dll => 0x82d460ebe6d2a60d => 75
	i64 9500688326720985260, ; 239: Microsoft.EntityFrameworkCore.SqlServer => 0x83d939b243e798ac => 52
	i64 9575902398040817096, ; 240: Xamarin.Google.Crypto.Tink.Android.dll => 0x84e4707ee708bdc8 => 127
	i64 9659729154652888475, ; 241: System.Text.RegularExpressions => 0x860e407c9991dd9b => 210
	i64 9667360217193089419, ; 242: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 149
	i64 9678050649315576968, ; 243: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 105
	i64 9702891218465930390, ; 244: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 138
	i64 9808709177481450983, ; 245: Mono.Android.dll => 0x881f890734e555e7 => 227
	i64 9819168441846169364, ; 246: Microsoft.IdentityModel.Protocols.dll => 0x8844b1ac75f77f14 => 76
	i64 9933555792566666578, ; 247: System.Linq.Queryable.dll => 0x89db145cf475c552 => 164
	i64 9956195530459977388, ; 248: Microsoft.Maui => 0x8a2b8315b36616ac => 82
	i64 9991543690424095600, ; 249: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 6
	i64 10038780035334861115, ; 250: System.Net.Http.dll => 0x8b50e941206af13b => 168
	i64 10051358222726253779, ; 251: System.Private.Xml => 0x8b7d990c97ccccd3 => 183
	i64 10089571585547156312, ; 252: System.IO.FileSystem.AccessControl => 0x8c055be67469bb58 => 157
	i64 10092835686693276772, ; 253: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 80
	i64 10143853363526200146, ; 254: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10229024438826829339, ; 255: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 108
	i64 10236703004850800690, ; 256: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 174
	i64 10245369515835430794, ; 257: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 185
	i64 10364469296367737616, ; 258: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 184
	i64 10406448008575299332, ; 259: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 129
	i64 10430153318873392755, ; 260: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 106
	i64 10447083246144586668, ; 261: Microsoft.Bcl.AsyncInterfaces.dll => 0x90fb7edc816203ac => 47
	i64 10506226065143327199, ; 262: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10546663366131771576, ; 263: System.Runtime.Serialization.Json.dll => 0x925d4673efe8e8b8 => 193
	i64 10670374202010151210, ; 264: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 134
	i64 10734191584620811116, ; 265: Microsoft.Extensions.FileProviders.Embedded.dll => 0x94f7825fc04f936c => 63
	i64 10785150219063592792, ; 266: System.Net.Primitives => 0x95ac8cfb68830758 => 171
	i64 10811915265162633087, ; 267: Microsoft.EntityFrameworkCore.Relational.dll => 0x960ba3a651a45f7f => 51
	i64 10822644899632537592, ; 268: System.Linq.Queryable => 0x9631c23204ca5ff8 => 164
	i64 10889380495983713167, ; 269: Microsoft.Data.SqlClient.dll => 0x971ed9dddf2d1b8f => 48
	i64 10964653383833615866, ; 270: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 151
	i64 11002576679268595294, ; 271: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 68
	i64 11009005086950030778, ; 272: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 82
	i64 11051904132540108364, ; 273: Microsoft.Extensions.FileProviders.Composite.dll => 0x99604040c7b98e4c => 62
	i64 11103970607964515343, ; 274: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11162124722117608902, ; 275: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 124
	i64 11218356222449480316, ; 276: Microsoft.AspNetCore.Components => 0x9baf9b8c02e4f27c => 40
	i64 11220793807500858938, ; 277: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 278: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 69
	i64 11340910727871153756, ; 279: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 107
	i64 11341245327015630248, ; 280: System.Configuration.ConfigurationManager.dll => 0x9d643289535355a8 => 93
	i64 11347436699239206956, ; 281: System.Xml.XmlSerializer.dll => 0x9d7a318e8162502c => 220
	i64 11485890710487134646, ; 282: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 189
	i64 11517440453979132662, ; 283: Microsoft.IdentityModel.Abstractions.dll => 0x9fd62b122523d2f6 => 73
	i64 11518296021396496455, ; 284: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 285: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 124
	i64 11530571088791430846, ; 286: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 67
	i64 11597940890313164233, ; 287: netstandard => 0xa0f429ca8d1805c9 => 223
	i64 11705530742807338875, ; 288: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 9
	i64 11707554492040141440, ; 289: System.Linq.Parallel.dll => 0xa27996c7fe94da80 => 163
	i64 12011556116648931059, ; 290: System.Security.Cryptography.ProtectedData => 0xa6b19ea5ec87aef3 => 98
	i64 12040886584167504988, ; 291: System.Net.ServicePoint => 0xa719d28d8e121c5c => 174
	i64 12048689113179125827, ; 292: Microsoft.Extensions.FileProviders.Physical => 0xa7358ae968287843 => 64
	i64 12058074296353848905, ; 293: Microsoft.Extensions.FileSystemGlobbing.dll => 0xa756e2afa5707e49 => 65
	i64 12102847907131387746, ; 294: System.Buffers => 0xa7f5f40c43256f62 => 135
	i64 12145679461940342714, ; 295: System.Text.Json => 0xa88e1f1ebcb62fba => 209
	i64 12198439281774268251, ; 296: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 0xa9498fe58c538f5b => 77
	i64 12201331334810686224, ; 297: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 194
	i64 12269460666702402136, ; 298: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 137
	i64 12439275739440478309, ; 299: Microsoft.IdentityModel.JsonWebTokens => 0xaca12f61007bf865 => 74
	i64 12451044538927396471, ; 300: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 110
	i64 12459959602091767212, ; 301: Microsoft.AspNetCore.Components.Authorization.dll => 0xaceaab3e0e65b5ac => 41
	i64 12466513435562512481, ; 302: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 115
	i64 12475113361194491050, ; 303: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12493213219680520345, ; 304: Microsoft.Data.SqlClient => 0xad60cf3b3e458899 => 48
	i64 12517810545449516888, ; 305: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 150
	i64 12538491095302438457, ; 306: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 103
	i64 12550732019250633519, ; 307: System.IO.Compression => 0xae2d28465e8e1b2f => 156
	i64 12681088699309157496, ; 308: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 14
	i64 12690486463116955105, ; 309: NuGet.Configuration.dll => 0xb01daa337cfd4de1 => 88
	i64 12699999919562409296, ; 310: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 149
	i64 12700543734426720211, ; 311: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 104
	i64 12708922737231849740, ; 312: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 207
	i64 12717050818822477433, ; 313: System.Runtime.Serialization.Xml.dll => 0xb07c0a5786811679 => 195
	i64 12823819093633476069, ; 314: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 27
	i64 12835242264250840079, ; 315: System.IO.Pipes => 0xb21ff0d5d6c0740f => 161
	i64 12843321153144804894, ; 316: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 70
	i64 12859557719246324186, ; 317: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 177
	i64 13003699287675270979, ; 318: Microsoft.AspNetCore.Components.WebView.Maui => 0xb4766b9b07e27743 => 45
	i64 13068258254871114833, ; 319: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 192
	i64 13173818576982874404, ; 320: System.Runtime.CompilerServices.VisualC.dll => 0xb6d2ce32a8819924 => 187
	i64 13221551921002590604, ; 321: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 1
	i64 13222659110913276082, ; 322: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 15
	i64 13231992148778445697, ; 323: InstaFood.PhoneApp.dll => 0xb7a17ac0d2b26b81 => 132
	i64 13252883958002779332, ; 324: NuGet.Common.dll => 0xb7ebb3be363a84c4 => 87
	i64 13343850469010654401, ; 325: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 226
	i64 13381594904270902445, ; 326: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13431476299110033919, ; 327: System.Net.WebClient => 0xba663087f18829ff => 176
	i64 13463706743370286408, ; 328: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 180
	i64 13465488254036897740, ; 329: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 128
	i64 13467053111158216594, ; 330: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 29
	i64 13540124433173649601, ; 331: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13545416393490209236, ; 332: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 13
	i64 13550417756503177631, ; 333: Microsoft.Extensions.FileProviders.Abstractions.dll => 0xbc0cc1280684799f => 61
	i64 13572454107664307259, ; 334: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 120
	i64 13710614125866346983, ; 335: System.Security.AccessControl.dll => 0xbe45e2e7d0b769e7 => 197
	i64 13717397318615465333, ; 336: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 142
	i64 13742054908850494594, ; 337: Azure.Identity => 0xbeb596218df25c82 => 36
	i64 13755568601956062840, ; 338: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 8
	i64 13814445057219246765, ; 339: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 11
	i64 13881769479078963060, ; 340: System.Console.dll => 0xc0a5f3cade5c6774 => 145
	i64 13959074834287824816, ; 341: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 110
	i64 14082136096249122791, ; 342: Microsoft.AspNetCore.Metadata => 0xc36dcc2b4fa28fe7 => 46
	i64 14100563506285742564, ; 343: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 3
	i64 14124974489674258913, ; 344: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 103
	i64 14125464355221830302, ; 345: System.Threading.dll => 0xc407bafdbc707a9e => 215
	i64 14133832980772275001, ; 346: Microsoft.EntityFrameworkCore.dll => 0xc425763635a1c339 => 49
	i64 14212104595480609394, ; 347: System.Security.Cryptography.Cng.dll => 0xc53b89d4a4518272 => 200
	i64 14254574811015963973, ; 348: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 207
	i64 14327709162229390963, ; 349: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 203
	i64 14327924848409182502, ; 350: BlazorBootstrap => 0xc6d703bcadec0126 => 37
	i64 14440148746670376211, ; 351: ChilkatDotNet46 => 0xc865b6c725170513 => 38
	i64 14461014870687870182, ; 352: System.Net.Requests.dll => 0xc8afd8683afdece6 => 172
	i64 14464374589798375073, ; 353: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14522721392235705434, ; 354: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 5
	i64 14551742072151931844, ; 355: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 208
	i64 14561513370130550166, ; 356: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 202
	i64 14622043554576106986, ; 357: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 192
	i64 14648804764802849406, ; 358: Azure.Identity.dll => 0xcb4b0252261f9a7e => 36
	i64 14669215534098758659, ; 359: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 57
	i64 14705122255218365489, ; 360: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14744092281598614090, ; 361: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14832630590065248058, ; 362: System.Security.Claims => 0xcdd816ef5d6e873a => 198
	i64 14852515768018889994, ; 363: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 107
	i64 14892012299694389861, ; 364: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 33
	i64 14904040806490515477, ; 365: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14912225920358050525, ; 366: System.Security.Principal.Windows => 0xcef2de7759506add => 205
	i64 14935719434541007538, ; 367: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 206
	i64 14954917835170835695, ; 368: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 58
	i64 14984936317414011727, ; 369: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 177
	i64 14987728460634540364, ; 370: System.IO.Compression.dll => 0xcfff1ba06622494c => 156
	i64 15015154896917945444, ; 371: System.Net.Security.dll => 0xd0608bd33642dc64 => 173
	i64 15024878362326791334, ; 372: System.Net.Http.Json => 0xd0831743ebf0f4a6 => 167
	i64 15051741671811457419, ; 373: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0xd0e2874d8f44218b => 60
	i64 15076659072870671916, ; 374: System.ObjectModel.dll => 0xd13b0d8c1620662c => 179
	i64 15111608613780139878, ; 375: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 376: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 155
	i64 15133485256822086103, ; 377: System.Linq.dll => 0xd204f0a9127dd9d7 => 165
	i64 15138356091203993725, ; 378: Microsoft.IdentityModel.Abstractions => 0xd2163ea89395c07d => 73
	i64 15227001540531775957, ; 379: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 56
	i64 15370334346939861994, ; 380: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 106
	i64 15383240894167415497, ; 381: System.Memory.Data => 0xd57c4016df1c7ac9 => 95
	i64 15391712275433856905, ; 382: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 58
	i64 15427448221306938193, ; 383: Microsoft.AspNetCore.Components.Web => 0xd6194e6b4dbb6351 => 43
	i64 15481710163200268842, ; 384: Microsoft.Extensions.FileProviders.Composite => 0xd6da155e291b5a2a => 62
	i64 15527772828719725935, ; 385: System.Console => 0xd77dbb1e38cd3d6f => 145
	i64 15536481058354060254, ; 386: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15541854775306130054, ; 387: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 203
	i64 15557562860424774966, ; 388: System.Net.Sockets => 0xd7e790fe7a6dc536 => 175
	i64 15582737692548360875, ; 389: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 114
	i64 15592226634512578529, ; 390: Microsoft.AspNetCore.Authorization.dll => 0xd862b7834f81b7e1 => 39
	i64 15609085926864131306, ; 391: System.dll => 0xd89e9cf3334914ea => 221
	i64 15661133872274321916, ; 392: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 218
	i64 15664356999916475676, ; 393: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 4
	i64 15743187114543869802, ; 394: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 12
	i64 15783653065526199428, ; 395: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 15847085070278954535, ; 396: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 211
	i64 15937190497610202713, ; 397: System.Security.Cryptography.Cng => 0xdd2c465197c97e59 => 200
	i64 15963349826457351533, ; 398: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 212
	i64 16018552496348375205, ; 399: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 170
	i64 16154507427712707110, ; 400: System => 0xe03056ea4e39aa26 => 221
	i64 16219561732052121626, ; 401: System.Net.Security => 0xe1177575db7c781a => 173
	i64 16288847719894691167, ; 402: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 403: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 68
	i64 16337011941688632206, ; 404: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 205
	i64 16422752383083464153, ; 405: InstaFood.Shared => 0xe3e95647ebe3c5d9 => 131
	i64 16454459195343277943, ; 406: System.Net.NetworkInformation => 0xe459fb756d988f77 => 170
	i64 16533548349183570019, ; 407: NuGet.Common => 0xe572f6a005d53063 => 87
	i64 16558262036769511634, ; 408: Microsoft.Extensions.Http => 0xe5cac397cf7b98d2 => 66
	i64 16649148416072044166, ; 409: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 84
	i64 16677317093839702854, ; 410: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 119
	i64 16833383113903931215, ; 411: mscorlib => 0xe99c30c1484d7f4f => 222
	i64 16856067890322379635, ; 412: System.Data.Common.dll => 0xe9ecc87060889373 => 146
	i64 16890310621557459193, ; 413: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 210
	i64 16942731696432749159, ; 414: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16945858842201062480, ; 415: Azure.Core => 0xeb2bc8d57f4e7c50 => 35
	i64 16998075588627545693, ; 416: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 117
	i64 17008137082415910100, ; 417: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 138
	i64 17031351772568316411, ; 418: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 116
	i64 17062143951396181894, ; 419: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 142
	i64 17079998892748052666, ; 420: Microsoft.AspNetCore.Components.dll => 0xed08587fce5018ba => 40
	i64 17089008752050867324, ; 421: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 32
	i64 17118171214553292978, ; 422: System.Threading.Channels => 0xed8ff6060fc420b2 => 211
	i64 17137864900836977098, ; 423: Microsoft.IdentityModel.Tokens => 0xedd5ed53b705e9ca => 78
	i64 17187273293601214786, ; 424: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 141
	i64 17197986060146327831, ; 425: Microsoft.Identity.Client.Extensions.Msal => 0xeeab8533ef244117 => 72
	i64 17202182880784296190, ; 426: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 201
	i64 17205988430934219272, ; 427: Microsoft.Extensions.FileSystemGlobbing => 0xeec7f35113509a08 => 65
	i64 17230721278011714856, ; 428: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 182
	i64 17234219099804750107, ; 429: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 216
	i64 17260702271250283638, ; 430: System.Data.Common => 0xef8a5543bba6bc76 => 146
	i64 17333249706306540043, ; 431: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 151
	i64 17342750010158924305, ; 432: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17360349973592121190, ; 433: Xamarin.Google.Crypto.Tink.Android => 0xf0ec5a52686b9f66 => 127
	i64 17371436720558481852, ; 434: System.Runtime.Caching => 0xf113bda8d710a1bc => 96
	i64 17438153253682247751, ; 435: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 25
	i64 17514990004910432069, ; 436: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17523946658117960076, ; 437: System.Security.Cryptography.ProtectedData.dll => 0xf33190a3c403c18c => 98
	i64 17623389608345532001, ; 438: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17702523067201099846, ; 439: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 31
	i64 17704177640604968747, ; 440: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 115
	i64 17710060891934109755, ; 441: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 113
	i64 17712670374920797664, ; 442: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 189
	i64 17777860260071588075, ; 443: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 191
	i64 17790600151040787804, ; 444: Microsoft.IdentityModel.Logging => 0xf6e4e89427cc055c => 75
	i64 17838668724098252521, ; 445: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 135
	i64 18017743553296241350, ; 446: Microsoft.Extensions.Caching.Abstractions => 0xfa0be24cb44e92c6 => 53
	i64 18025913125965088385, ; 447: System.Threading => 0xfa28e87b91334681 => 215
	i64 18099568558057551825, ; 448: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 19
	i64 18121036031235206392, ; 449: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 116
	i64 18146411883821974900, ; 450: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 154
	i64 18203743254473369877, ; 451: System.Security.Cryptography.Pkcs.dll => 0xfca0b00ad94c6915 => 97
	i64 18225059387460068507, ; 452: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 214
	i64 18245806341561545090, ; 453: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 136
	i64 18305135509493619199, ; 454: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 118
	i64 18324163916253801303 ; 455: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [456 x i32] [
	i32 70, ; 0
	i32 227, ; 1
	i32 83, ; 2
	i32 162, ; 3
	i32 104, ; 4
	i32 121, ; 5
	i32 122, ; 6
	i32 7, ; 7
	i32 186, ; 8
	i32 71, ; 9
	i32 63, ; 10
	i32 89, ; 11
	i32 213, ; 12
	i32 144, ; 13
	i32 10, ; 14
	i32 109, ; 15
	i32 85, ; 16
	i32 186, ; 17
	i32 35, ; 18
	i32 126, ; 19
	i32 18, ; 20
	i32 132, ; 21
	i32 153, ; 22
	i32 52, ; 23
	i32 117, ; 24
	i32 158, ; 25
	i32 171, ; 26
	i32 80, ; 27
	i32 226, ; 28
	i32 213, ; 29
	i32 16, ; 30
	i32 92, ; 31
	i32 101, ; 32
	i32 114, ; 33
	i32 86, ; 34
	i32 166, ; 35
	i32 181, ; 36
	i32 79, ; 37
	i32 100, ; 38
	i32 188, ; 39
	i32 6, ; 40
	i32 121, ; 41
	i32 187, ; 42
	i32 47, ; 43
	i32 152, ; 44
	i32 28, ; 45
	i32 122, ; 46
	i32 81, ; 47
	i32 28, ; 48
	i32 199, ; 49
	i32 113, ; 50
	i32 2, ; 51
	i32 20, ; 52
	i32 212, ; 53
	i32 160, ; 54
	i32 152, ; 55
	i32 86, ; 56
	i32 102, ; 57
	i32 50, ; 58
	i32 109, ; 59
	i32 136, ; 60
	i32 45, ; 61
	i32 24, ; 62
	i32 159, ; 63
	i32 77, ; 64
	i32 112, ; 65
	i32 208, ; 66
	i32 89, ; 67
	i32 105, ; 68
	i32 196, ; 69
	i32 99, ; 70
	i32 96, ; 71
	i32 27, ; 72
	i32 78, ; 73
	i32 222, ; 74
	i32 169, ; 75
	i32 57, ; 76
	i32 2, ; 77
	i32 79, ; 78
	i32 74, ; 79
	i32 197, ; 80
	i32 93, ; 81
	i32 7, ; 82
	i32 126, ; 83
	i32 195, ; 84
	i32 39, ; 85
	i32 111, ; 86
	i32 178, ; 87
	i32 191, ; 88
	i32 175, ; 89
	i32 129, ; 90
	i32 61, ; 91
	i32 94, ; 92
	i32 83, ; 93
	i32 160, ; 94
	i32 55, ; 95
	i32 123, ; 96
	i32 54, ; 97
	i32 37, ; 98
	i32 224, ; 99
	i32 22, ; 100
	i32 196, ; 101
	i32 56, ; 102
	i32 218, ; 103
	i32 55, ; 104
	i32 223, ; 105
	i32 120, ; 106
	i32 44, ; 107
	i32 46, ; 108
	i32 67, ; 109
	i32 64, ; 110
	i32 81, ; 111
	i32 201, ; 112
	i32 172, ; 113
	i32 166, ; 114
	i32 194, ; 115
	i32 183, ; 116
	i32 33, ; 117
	i32 144, ; 118
	i32 214, ; 119
	i32 198, ; 120
	i32 162, ; 121
	i32 143, ; 122
	i32 30, ; 123
	i32 161, ; 124
	i32 42, ; 125
	i32 51, ; 126
	i32 50, ; 127
	i32 66, ; 128
	i32 158, ; 129
	i32 0, ; 130
	i32 220, ; 131
	i32 141, ; 132
	i32 99, ; 133
	i32 123, ; 134
	i32 153, ; 135
	i32 169, ; 136
	i32 190, ; 137
	i32 139, ; 138
	i32 139, ; 139
	i32 43, ; 140
	i32 176, ; 141
	i32 190, ; 142
	i32 188, ; 143
	i32 26, ; 144
	i32 91, ; 145
	i32 38, ; 146
	i32 29, ; 147
	i32 155, ; 148
	i32 204, ; 149
	i32 163, ; 150
	i32 199, ; 151
	i32 125, ; 152
	i32 88, ; 153
	i32 154, ; 154
	i32 202, ; 155
	i32 59, ; 156
	i32 23, ; 157
	i32 130, ; 158
	i32 41, ; 159
	i32 23, ; 160
	i32 209, ; 161
	i32 216, ; 162
	i32 180, ; 163
	i32 184, ; 164
	i32 34, ; 165
	i32 91, ; 166
	i32 112, ; 167
	i32 11, ; 168
	i32 102, ; 169
	i32 108, ; 170
	i32 69, ; 171
	i32 92, ; 172
	i32 130, ; 173
	i32 206, ; 174
	i32 19, ; 175
	i32 22, ; 176
	i32 150, ; 177
	i32 219, ; 178
	i32 217, ; 179
	i32 178, ; 180
	i32 44, ; 181
	i32 182, ; 182
	i32 97, ; 183
	i32 159, ; 184
	i32 90, ; 185
	i32 26, ; 186
	i32 165, ; 187
	i32 134, ; 188
	i32 95, ; 189
	i32 143, ; 190
	i32 217, ; 191
	i32 179, ; 192
	i32 94, ; 193
	i32 148, ; 194
	i32 168, ; 195
	i32 17, ; 196
	i32 224, ; 197
	i32 133, ; 198
	i32 128, ; 199
	i32 157, ; 200
	i32 101, ; 201
	i32 60, ; 202
	i32 53, ; 203
	i32 42, ; 204
	i32 140, ; 205
	i32 111, ; 206
	i32 167, ; 207
	i32 147, ; 208
	i32 225, ; 209
	i32 140, ; 210
	i32 72, ; 211
	i32 84, ; 212
	i32 148, ; 213
	i32 204, ; 214
	i32 119, ; 215
	i32 185, ; 216
	i32 131, ; 217
	i32 90, ; 218
	i32 85, ; 219
	i32 137, ; 220
	i32 181, ; 221
	i32 21, ; 222
	i32 225, ; 223
	i32 133, ; 224
	i32 118, ; 225
	i32 21, ; 226
	i32 147, ; 227
	i32 59, ; 228
	i32 219, ; 229
	i32 193, ; 230
	i32 71, ; 231
	i32 31, ; 232
	i32 76, ; 233
	i32 54, ; 234
	i32 49, ; 235
	i32 125, ; 236
	i32 100, ; 237
	i32 75, ; 238
	i32 52, ; 239
	i32 127, ; 240
	i32 210, ; 241
	i32 149, ; 242
	i32 105, ; 243
	i32 138, ; 244
	i32 227, ; 245
	i32 76, ; 246
	i32 164, ; 247
	i32 82, ; 248
	i32 6, ; 249
	i32 168, ; 250
	i32 183, ; 251
	i32 157, ; 252
	i32 80, ; 253
	i32 3, ; 254
	i32 108, ; 255
	i32 174, ; 256
	i32 185, ; 257
	i32 184, ; 258
	i32 129, ; 259
	i32 106, ; 260
	i32 47, ; 261
	i32 1, ; 262
	i32 193, ; 263
	i32 134, ; 264
	i32 63, ; 265
	i32 171, ; 266
	i32 51, ; 267
	i32 164, ; 268
	i32 48, ; 269
	i32 151, ; 270
	i32 68, ; 271
	i32 82, ; 272
	i32 62, ; 273
	i32 12, ; 274
	i32 124, ; 275
	i32 40, ; 276
	i32 15, ; 277
	i32 69, ; 278
	i32 107, ; 279
	i32 93, ; 280
	i32 220, ; 281
	i32 189, ; 282
	i32 73, ; 283
	i32 13, ; 284
	i32 124, ; 285
	i32 67, ; 286
	i32 223, ; 287
	i32 9, ; 288
	i32 163, ; 289
	i32 98, ; 290
	i32 174, ; 291
	i32 64, ; 292
	i32 65, ; 293
	i32 135, ; 294
	i32 209, ; 295
	i32 77, ; 296
	i32 194, ; 297
	i32 137, ; 298
	i32 74, ; 299
	i32 110, ; 300
	i32 41, ; 301
	i32 115, ; 302
	i32 34, ; 303
	i32 48, ; 304
	i32 150, ; 305
	i32 103, ; 306
	i32 156, ; 307
	i32 14, ; 308
	i32 88, ; 309
	i32 149, ; 310
	i32 104, ; 311
	i32 207, ; 312
	i32 195, ; 313
	i32 27, ; 314
	i32 161, ; 315
	i32 70, ; 316
	i32 177, ; 317
	i32 45, ; 318
	i32 192, ; 319
	i32 187, ; 320
	i32 1, ; 321
	i32 15, ; 322
	i32 132, ; 323
	i32 87, ; 324
	i32 226, ; 325
	i32 9, ; 326
	i32 176, ; 327
	i32 180, ; 328
	i32 128, ; 329
	i32 29, ; 330
	i32 30, ; 331
	i32 13, ; 332
	i32 61, ; 333
	i32 120, ; 334
	i32 197, ; 335
	i32 142, ; 336
	i32 36, ; 337
	i32 8, ; 338
	i32 11, ; 339
	i32 145, ; 340
	i32 110, ; 341
	i32 46, ; 342
	i32 3, ; 343
	i32 103, ; 344
	i32 215, ; 345
	i32 49, ; 346
	i32 200, ; 347
	i32 207, ; 348
	i32 203, ; 349
	i32 37, ; 350
	i32 38, ; 351
	i32 172, ; 352
	i32 24, ; 353
	i32 5, ; 354
	i32 208, ; 355
	i32 202, ; 356
	i32 192, ; 357
	i32 36, ; 358
	i32 57, ; 359
	i32 16, ; 360
	i32 32, ; 361
	i32 198, ; 362
	i32 107, ; 363
	i32 33, ; 364
	i32 0, ; 365
	i32 205, ; 366
	i32 206, ; 367
	i32 58, ; 368
	i32 177, ; 369
	i32 156, ; 370
	i32 173, ; 371
	i32 167, ; 372
	i32 60, ; 373
	i32 179, ; 374
	i32 17, ; 375
	i32 155, ; 376
	i32 165, ; 377
	i32 73, ; 378
	i32 56, ; 379
	i32 106, ; 380
	i32 95, ; 381
	i32 58, ; 382
	i32 43, ; 383
	i32 62, ; 384
	i32 145, ; 385
	i32 4, ; 386
	i32 203, ; 387
	i32 175, ; 388
	i32 114, ; 389
	i32 39, ; 390
	i32 221, ; 391
	i32 218, ; 392
	i32 4, ; 393
	i32 12, ; 394
	i32 5, ; 395
	i32 211, ; 396
	i32 200, ; 397
	i32 212, ; 398
	i32 170, ; 399
	i32 221, ; 400
	i32 173, ; 401
	i32 18, ; 402
	i32 68, ; 403
	i32 205, ; 404
	i32 131, ; 405
	i32 170, ; 406
	i32 87, ; 407
	i32 66, ; 408
	i32 84, ; 409
	i32 119, ; 410
	i32 222, ; 411
	i32 146, ; 412
	i32 210, ; 413
	i32 25, ; 414
	i32 35, ; 415
	i32 117, ; 416
	i32 138, ; 417
	i32 116, ; 418
	i32 142, ; 419
	i32 40, ; 420
	i32 32, ; 421
	i32 211, ; 422
	i32 78, ; 423
	i32 141, ; 424
	i32 72, ; 425
	i32 201, ; 426
	i32 65, ; 427
	i32 182, ; 428
	i32 216, ; 429
	i32 146, ; 430
	i32 151, ; 431
	i32 10, ; 432
	i32 127, ; 433
	i32 96, ; 434
	i32 25, ; 435
	i32 8, ; 436
	i32 98, ; 437
	i32 20, ; 438
	i32 31, ; 439
	i32 115, ; 440
	i32 113, ; 441
	i32 189, ; 442
	i32 191, ; 443
	i32 75, ; 444
	i32 135, ; 445
	i32 53, ; 446
	i32 215, ; 447
	i32 19, ; 448
	i32 116, ; 449
	i32 154, ; 450
	i32 97, ; 451
	i32 214, ; 452
	i32 136, ; 453
	i32 118, ; 454
	i32 14 ; 455
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
