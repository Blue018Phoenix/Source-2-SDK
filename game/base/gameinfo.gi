"GameInfo"
{
	game 		"Source 2 SDK"
	title 		"Source 2 SDK"
	type		singleplayer_only

	GameData	"base.fgd"

	FileSystem
	{
		SteamAppId				890		// This will mount all the GCFs we need (240=CS:S, 220=HL2).
		//
		// The code that loads this file automatically does a few things here:
		//
		// 1. For each "Game" search path, it adds a "GameBin" path, in <dir>\bin
		// 2. For each "Game" search path, it adds another "Game" path in front of it with _<langage> at the end.
		//    For example: c:\hl2\cstrike on a french machine would get a c:\hl2\cstrike_french path added to it.
		// 3. If no "Mod" key, for the first "Game" search path, it adds a search path called "MOD".
		// 4. If no "Write" key, for the first "Game" search path, it adds a search path called "DEFAULT_WRITE_PATH".
		//

		//
		// Search paths are relative to the exe directory\..\
		//
		SearchPaths
		{
			Game				base
			Game				core
			AddonRoot			addons
		}

		"AllowAddonDependencies" "1"
	}

	MaterialSystem2
	{
		RenderModes
		{
			"game" "Default"
			"game" "VrForward"
			"game" "Depth"

			"tools" "ToolsVis" // Visualization modes for all shaders (lighting only, normal maps only, etc.)
			"tools" "ToolsWireframe" // This should use the ToolsVis mode above instead of being its own mode
			"tools" "ToolsUtil" // Meant to be used to render tools sceneobjects that are mod-independent, like the origin grid
		}
	}

	MaterialEditor
	{
		"DefaultShader" "vr_standard"
	}


	Engine2
	{
		"HasModAppSystems" "1"
		"Capable64Bit" "1"
		"URLName" "source2sdk"
		"UsesPanorama" "1"
		"PanoramaUIClientFromClient" "1"
		"RenderingPipeline"
		{
			"SkipPostProcessing" "1"
		}
		"UsesVGui" "0"
		"UsesBink" "0"
		"SaveClientStateInSaveGames" "0"
		"AllowSaveGamesInMultiplayer" "1"
		"AllocWarnMB" "2048"
		"ReserveWarnMB" "2048"
		"PerformsShutdown"	"1"
		"PreloadIcuucDll" "1"
	}

	SceneSystem
	{
		"SunLightMaxCascadeSize" "3"
		"SunLightMaxShadowBufferSize" "3072"
		"SunLightShadowRenderMode" "Depth"
		"VrLightBinner" "1"
		"VrDefaultShadowTextureWidth" "6144"
		"VrDefaultShadowTextureHeight" "6144"
		"Tonemapping" "0"
		"CubemapFog" "1"
	}

	ToolsEnvironment
	{
		"Engine"	"Source 2"
		"ToolsDir"	"../sdktools"	// NOTE: Default Tools path. This is relative to the mod path.
		"ToolsProductName" "Source 2 SDK"
		"ShowCoreMod"	"1"
	}
	
	Hammer
	{
		"fgd"					"base.fgd"	// NOTE: This is relative to the 'game' path.
		"DefaultTextureScale"	"0.250000"
		"DefaultMinDrawVolumeSize"	"1024.0"
		"DefaultSolidEntity"	"trigger_multiple"
		"DefaultPointEntity"	"info_player_start"
		"NavMarkupEntity"		"func_nav_markup"
		"AddonMapCommand"		"destinations_load_addon"
		"UseUncompressedVertices"	"1"
		"UsesBakedLighting"		"1"
	}

	ModelDoc
	{
		"features"					"animgraph;modelconfig"
	}

	RenderPipelineAliases
	{
		"Tools"			"VR"
		"EnvMapBake"	"VR"
	}

	ResourceCompiler
	{
		// Overrides of the default builders as specified in code, this controls which map builder steps
		// will be run when resource compiler is run for a map without specifiying any specific map builder
		// steps. Additionally this controls which builders are displayed in the hammer build dialog.
		DefaultMapBuilders
		{			
			"bakedlighting"	"1"	// Enable lightmapping during compile time
			"dontrequirebakedlighting"	"1"	// Don't warn about old maps using per-vertex indirect lighting baked from within hammer
			"envmap"	"0"	// Using env_cubemap entities
		}

		BakedLighting
		{
			Version 1
			LightmapChannels
			{
				irradiance 1
				directional_irradiance 1
				// data is in directional_irradiance.a
				//ao 1
			}
		}
	}

	TextureCompiler
	{
		ImagePreprocessors
		{
			"FillToMultipleOfFour" "1"
		}

		"AllowNP2Textures" "1"
	}

	WorldRenderer
	{
		"IrradianceVolumes"		"0"
		"EnvironmentMaps"		"1"
		"EnvironmentMapFaceSize" "1024"
		"EnvironmentMapRenderSize" "4096"
		"EnvironmentMapFormat" "DXT5"
		"EnvironmentMapColorSpace" "srgb"
		"EnvironmentMapMipProcessor" "GGXCubeMapBlur_RGBM"
		"LightProbeVolumeAlgorithm" "EncodeRGBM"
		"LightProbeVolumeColorSpace" "srgb"
		"LightProbeVolumeCompressedFormat" "DXT5"
		"LightProbeVolumeUncompressedFormat" "RGBA8888"
	}
	
	Source1Import
	{                              
		"importmod"			"base"
		"importdir"			"..\base"
		"synthesizeMeshNames"	"1"
	}

	SoundSystem
	{
		"SteamAudioEnabled"			"1"
	}

	RenderSystem
	{
		"AllowSampleableDepthInVr" "1"
		"VulkanUseStreamingTextureManager" "1"
	}
}
