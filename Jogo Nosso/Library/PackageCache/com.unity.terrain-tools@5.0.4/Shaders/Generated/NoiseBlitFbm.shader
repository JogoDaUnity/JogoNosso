//////////////////////////////////////////////////////////////////////////
//
//      DO NOT EDIT THIS FILE!! THIS IS AUTOMATICALLY GENERATED!!
//      DO NOT EDIT THIS FILE!! THIS IS AUTOMATICALLY GENERATED!!
//      DO NOT EDIT THIS FILE!! THIS IS AUTOMATICALLY GENERATED!!
//
//////////////////////////////////////////////////////////////////////////

Shader "Hidden/TerrainTools/Noise/NoiseBlit/NoiseBlitFbm"
{
    Properties { _MainTex ("Texture", any) = "" {} }

    SubShader
    {
        ZTest Always Cull OFF ZWrite Off

        HLSLINCLUDE

        #include "UnityCG.cginc"

        sampler2D _MainTex;
        float4 _MainTex_TexelSize;      // 1/width, 1/height, width, height

        struct appdata_t
        {
            float4 vertex : POSITION;
            float2 uv : TEXCOORD0;
        };

        struct v2f
        {
            float4 vertex : SV_POSITION;
            float2 uv : TEXCOORD0;
        };

        v2f vert( appdata_t v )
        {
            v2f o;
            
            o.vertex = UnityObjectToClipPos( v.vertex );
            o.uv = v.uv;

            return o;
        }

        ENDHLSL

        
        
        // Pass
        // {
        //     Name "Value Raw Noise Blit (2D)"

        //     HLSLPROGRAM

        //     #pragma vertex vert
        //     #pragma fragment frag

        //     #include "Packages/com.unity.terrain-tools/Shaders/NoiseLib/Fbm/Value.hlsl"

        //     float4 frag( v2f i ) : SV_Target
        //     {
        //         float3 pos = ApplyNoiseTransform( float3(i.uv.x, 0, i.uv.y) - float3(.5, 0, .5) );

        //         float n = noise_FbmValue( pos, GetFbmFractalInput() );

        //         return n;
        //     }

        //     ENDHLSL
        // }

        Pass // 0 - 2D Value Noise
        {
            Name "Value Raw Noise Blit (2D)"

            HLSLPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            #pragma shader_feature USE_NOISE_TEXTURE

            #include "Packages/com.unity.terrain-tools/Shaders/NoiseLib/Fbm/Value.hlsl"

#if USE_NOISE_TEXTURE

            sampler2D _NoiseTex;

#endif

            float4 frag( v2f i ) : SV_Target
            {
                // calc pos for center of pixel
                float3 uv = float3( i.uv.x, 0, i.uv.y ) - float3( .5, 0, .5 );

#if USE_NOISE_TEXTURE
                
                float pos = tex2D( _NoiseTex, i.uv ).r * _NoiseTransform._m00 + _NoiseTransform._m13;

#else

                float3 pos = ApplyNoiseTransform( uv.xyz );

#endif

                float n = noise_FbmValue( pos, GetFbmFractalInput() );

                return PackHeightmap(n);
            }

            ENDHLSL
        }

        Pass // 1 - 3D Value Noise
        {
            Name "Value Raw Noise Blit (3D)"

            HLSLPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            #pragma shader_feature _ USE_NOISE_TEXTURE

            #include "Packages/com.unity.terrain-tools/Shaders/NoiseLib/Fbm/Value.hlsl"

#if USE_NOISE_TEXTURE

            sampler3D _NoiseTex;

#endif

            float _UVY;

            float4 frag( v2f i ) : SV_Target
            {
#if USE_NOISE_TEXTURE

                float pos = tex3D( _NoiseTex, float3(i.uv.x, _UVY, i.uv.y) ).r;

#else

                float3 pos = ApplyNoiseTransform( float3(i.uv.x, _UVY, i.uv.y) - float3(.5, 0, .5) );

#endif

                float n = noise_FbmValue( pos, GetFbmFractalInput() );

                return PackHeightmap(n);
            }

            ENDHLSL
        }

        

        
        // Pass
        // {
        //     Name "Voronoi Raw Noise Blit (2D)"

        //     HLSLPROGRAM

        //     #pragma vertex vert
        //     #pragma fragment frag

        //     #include "Packages/com.unity.terrain-tools/Shaders/NoiseLib/Fbm/Voronoi.hlsl"

        //     float4 frag( v2f i ) : SV_Target
        //     {
        //         float3 pos = ApplyNoiseTransform( float3(i.uv.x, 0, i.uv.y) - float3(.5, 0, .5) );

        //         float n = noise_FbmVoronoi( pos, GetFbmFractalInput() );

        //         return n;
        //     }

        //     ENDHLSL
        // }

        Pass // 0 - 2D Voronoi Noise
        {
            Name "Voronoi Raw Noise Blit (2D)"

            HLSLPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            #pragma shader_feature USE_NOISE_TEXTURE

            #include "Packages/com.unity.terrain-tools/Shaders/NoiseLib/Fbm/Voronoi.hlsl"

#if USE_NOISE_TEXTURE

            sampler2D _NoiseTex;

#endif

            float4 frag( v2f i ) : SV_Target
            {
                // calc pos for center of pixel
                float3 uv = float3( i.uv.x, 0, i.uv.y ) - float3( .5, 0, .5 );

#if USE_NOISE_TEXTURE
                
                float pos = tex2D( _NoiseTex, i.uv ).r * _NoiseTransform._m00 + _NoiseTransform._m13;

#else

                float3 pos = ApplyNoiseTransform( uv.xyz );

#endif

                float n = noise_FbmVoronoi( pos, GetFbmFractalInput() );

                return PackHeightmap(n);
            }

            ENDHLSL
        }

        Pass // 1 - 3D Voronoi Noise
        {
            Name "Voronoi Raw Noise Blit (3D)"

            HLSLPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            #pragma shader_feature _ USE_NOISE_TEXTURE

            #include "Packages/com.unity.terrain-tools/Shaders/NoiseLib/Fbm/Voronoi.hlsl"

#if USE_NOISE_TEXTURE

            sampler3D _NoiseTex;

#endif

            float _UVY;

            float4 frag( v2f i ) : SV_Target
            {
#if USE_NOISE_TEXTURE

                float pos = tex3D( _NoiseTex, float3(i.uv.x, _UVY, i.uv.y) ).r;

#else

                float3 pos = ApplyNoiseTransform( float3(i.uv.x, _UVY, i.uv.y) - float3(.5, 0, .5) );

#endif

                float n = noise_FbmVoronoi( pos, GetFbmFractalInput() );

                return PackHeightmap(n);
            }

            ENDHLSL
        }

        

        
        // Pass
        // {
        //     Name "Perlin Raw Noise Blit (2D)"

        //     HLSLPROGRAM

        //     #pragma vertex vert
        //     #pragma fragment frag

        //     #include "Packages/com.unity.terrain-tools/Shaders/NoiseLib/Fbm/Perlin.hlsl"

        //     float4 frag( v2f i ) : SV_Target
        //     {
        //         float3 pos = ApplyNoiseTransform( float3(i.uv.x, 0, i.uv.y) - float3(.5, 0, .5) );

        //         float n = noise_FbmPerlin( pos, GetFbmFractalInput() );

        //         return n;
        //     }

        //     ENDHLSL
        // }

        Pass // 0 - 2D Perlin Noise
        {
            Name "Perlin Raw Noise Blit (2D)"

            HLSLPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            #pragma shader_feature USE_NOISE_TEXTURE

            #include "Packages/com.unity.terrain-tools/Shaders/NoiseLib/Fbm/Perlin.hlsl"

#if USE_NOISE_TEXTURE

            sampler2D _NoiseTex;

#endif

            float4 frag( v2f i ) : SV_Target
            {
                // calc pos for center of pixel
                float3 uv = float3( i.uv.x, 0, i.uv.y ) - float3( .5, 0, .5 );

#if USE_NOISE_TEXTURE
                
                float pos = tex2D( _NoiseTex, i.uv ).r * _NoiseTransform._m00 + _NoiseTransform._m13;

#else

                float3 pos = ApplyNoiseTransform( uv.xyz );

#endif

                float n = noise_FbmPerlin( pos, GetFbmFractalInput() );

                return PackHeightmap(n);
            }

            ENDHLSL
        }

        Pass // 1 - 3D Perlin Noise
        {
            Name "Perlin Raw Noise Blit (3D)"

            HLSLPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            #pragma shader_feature _ USE_NOISE_TEXTURE

            #include "Packages/com.unity.terrain-tools/Shaders/NoiseLib/Fbm/Perlin.hlsl"

#if USE_NOISE_TEXTURE

            sampler3D _NoiseTex;

#endif

            float _UVY;

            float4 frag( v2f i ) : SV_Target
            {
#if USE_NOISE_TEXTURE

                float pos = tex3D( _NoiseTex, float3(i.uv.x, _UVY, i.uv.y) ).r;

#else

                float3 pos = ApplyNoiseTransform( float3(i.uv.x, _UVY, i.uv.y) - float3(.5, 0, .5) );

#endif

                float n = noise_FbmPerlin( pos, GetFbmFractalInput() );

                return PackHeightmap(n);
            }

            ENDHLSL
        }

        

        
        // Pass
        // {
        //     Name "Billow Raw Noise Blit (2D)"

        //     HLSLPROGRAM

        //     #pragma vertex vert
        //     #pragma fragment frag

        //     #include "Packages/com.unity.terrain-tools/Shaders/NoiseLib/Fbm/Billow.hlsl"

        //     float4 frag( v2f i ) : SV_Target
        //     {
        //         float3 pos = ApplyNoiseTransform( float3(i.uv.x, 0, i.uv.y) - float3(.5, 0, .5) );

        //         float n = noise_FbmBillow( pos, GetFbmFractalInput() );

        //         return n;
        //     }

        //     ENDHLSL
        // }

        Pass // 0 - 2D Billow Noise
        {
            Name "Billow Raw Noise Blit (2D)"

            HLSLPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            #pragma shader_feature USE_NOISE_TEXTURE

            #include "Packages/com.unity.terrain-tools/Shaders/NoiseLib/Fbm/Billow.hlsl"

#if USE_NOISE_TEXTURE

            sampler2D _NoiseTex;

#endif

            float4 frag( v2f i ) : SV_Target
            {
                // calc pos for center of pixel
                float3 uv = float3( i.uv.x, 0, i.uv.y ) - float3( .5, 0, .5 );

#if USE_NOISE_TEXTURE
                
                float pos = tex2D( _NoiseTex, i.uv ).r * _NoiseTransform._m00 + _NoiseTransform._m13;

#else

                float3 pos = ApplyNoiseTransform( uv.xyz );

#endif

                float n = noise_FbmBillow( pos, GetFbmFractalInput() );

                return PackHeightmap(n);
            }

            ENDHLSL
        }

        Pass // 1 - 3D Billow Noise
        {
            Name "Billow Raw Noise Blit (3D)"

            HLSLPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            #pragma shader_feature _ USE_NOISE_TEXTURE

            #include "Packages/com.unity.terrain-tools/Shaders/NoiseLib/Fbm/Billow.hlsl"

#if USE_NOISE_TEXTURE

            sampler3D _NoiseTex;

#endif

            float _UVY;

            float4 frag( v2f i ) : SV_Target
            {
#if USE_NOISE_TEXTURE

                float pos = tex3D( _NoiseTex, float3(i.uv.x, _UVY, i.uv.y) ).r;

#else

                float3 pos = ApplyNoiseTransform( float3(i.uv.x, _UVY, i.uv.y) - float3(.5, 0, .5) );

#endif

                float n = noise_FbmBillow( pos, GetFbmFractalInput() );

                return PackHeightmap(n);
            }

            ENDHLSL
        }

        

        
        // Pass
        // {
        //     Name "Ridge Raw Noise Blit (2D)"

        //     HLSLPROGRAM

        //     #pragma vertex vert
        //     #pragma fragment frag

        //     #include "Packages/com.unity.terrain-tools/Shaders/NoiseLib/Fbm/Ridge.hlsl"

        //     float4 frag( v2f i ) : SV_Target
        //     {
        //         float3 pos = ApplyNoiseTransform( float3(i.uv.x, 0, i.uv.y) - float3(.5, 0, .5) );

        //         float n = noise_FbmRidge( pos, GetFbmFractalInput() );

        //         return n;
        //     }

        //     ENDHLSL
        // }

        Pass // 0 - 2D Ridge Noise
        {
            Name "Ridge Raw Noise Blit (2D)"

            HLSLPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            #pragma shader_feature USE_NOISE_TEXTURE

            #include "Packages/com.unity.terrain-tools/Shaders/NoiseLib/Fbm/Ridge.hlsl"

#if USE_NOISE_TEXTURE

            sampler2D _NoiseTex;

#endif

            float4 frag( v2f i ) : SV_Target
            {
                // calc pos for center of pixel
                float3 uv = float3( i.uv.x, 0, i.uv.y ) - float3( .5, 0, .5 );

#if USE_NOISE_TEXTURE
                
                float pos = tex2D( _NoiseTex, i.uv ).r * _NoiseTransform._m00 + _NoiseTransform._m13;

#else

                float3 pos = ApplyNoiseTransform( uv.xyz );

#endif

                float n = noise_FbmRidge( pos, GetFbmFractalInput() );

                return PackHeightmap(n);
            }

            ENDHLSL
        }

        Pass // 1 - 3D Ridge Noise
        {
            Name "Ridge Raw Noise Blit (3D)"

            HLSLPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            #pragma shader_feature _ USE_NOISE_TEXTURE

            #include "Packages/com.unity.terrain-tools/Shaders/NoiseLib/Fbm/Ridge.hlsl"

#if USE_NOISE_TEXTURE

            sampler3D _NoiseTex;

#endif

            float _UVY;

            float4 frag( v2f i ) : SV_Target
            {
#if USE_NOISE_TEXTURE

                float pos = tex3D( _NoiseTex, float3(i.uv.x, _UVY, i.uv.y) ).r;

#else

                float3 pos = ApplyNoiseTransform( float3(i.uv.x, _UVY, i.uv.y) - float3(.5, 0, .5) );

#endif

                float n = noise_FbmRidge( pos, GetFbmFractalInput() );

                return PackHeightmap(n);
            }

            ENDHLSL
        }

        

    }
}