/**
 * Mandelbulber v2, a 3D fractal generator  _%}}i*<.        ____                _______
 * Copyright (C) 2023 Mandelbulber Team   _>]|=||i=i<,     / __ \___  ___ ___  / ___/ /
 *                                        \><||i|=>>%)    / /_/ / _ \/ -_) _ \/ /__/ /__
 * This file is part of Mandelbulber.     )<=i=]=|=i<>    \____/ .__/\__/_//_/\___/____/
 * The project is licensed under GPLv3,   -<>>=|><|||`        /_/
 * see also COPYING file in this folder.    ~+{i%+++
 *
 * formula by TGlad,
 * https://fractalforums.org/fractal-mathematics-and-new-theories/28/fractal-clusters/5107

 * This file has been autogenerated by tools/populateUiInformation.php
 * from the file "fractal_menger_v7.cpp" in the folder formula/definition
 * D O    N O T    E D I T    T H I S    F I L E !
 */

REAL4 MengerV7Iteration(REAL4 z, __constant sFractalCl *fractal, sExtendedAuxCl *aux)
{
	REAL t = 0.0f;
	REAL4 oldZ = z;
	REAL col = 0.0f;
	REAL d;
	int mat_struct = fractal->transformCommon.int1;
	int children = fractal->transformCommon.int3;

	REAL scale = fractal->transformCommon.scale3;
	REAL4 ColV = (REAL4){0.0f, 0.0f, 0.0f, 0.0f};
	REAL3 p = (REAL3){z.x, z.y, z.z}; // convert to vec3
	if (fractal->transformCommon.functionEnabledDFalse) aux->DE = 1.0f;

	p *= fractal->transformCommon.scaleG1; // master scale
	aux->DE *= fractal->transformCommon.scaleG1;

	// REAL scale = 1.0f;
	p *= scale;
	aux->DE *= scale;
	REAL min_dist = 100000.0f;
	for (int n = 0; n < fractal->transformCommon.int16; n++)
	{
		p.x = fabs(p.x);
		p.y = fabs(p.y);
		p.z = fabs(p.z);
		if (fractal->transformCommon.functionEnabledPFalse
				&& n >= fractal->transformCommon.startIterationsP
				&& n < fractal->transformCommon.stopIterationsP1)
		{
			p.x += fractal->transformCommon.offsetA000.x;
			p.y += fractal->transformCommon.offsetA000.y;
			p.z += fractal->transformCommon.offsetA000.z;
		}

		if (p.y > p.x)
		{
			t = p.x;
			p.x = p.y;
			p.y = t;
		}
		if (p.z > p.x)
		{
			t = p.x;
			p.x = p.z;
			p.z = t;
		}

		if (fractal->transformCommon.functionEnabledAFalse)
		{
			if (p.z > p.y)
			{
				t = p.y;
				p.y = p.z;
				p.z = t;
			}
		}
		REAL3 q = (REAL3){1.0f, 0.0f, 0.0f};
		if (children >= 3 || mat_struct == 3) q = (REAL3){1.0f, 1.0f, 1.0f};
		REAL3 p1 = p - q;
		REAL3 p2 = p - (REAL3){1.0f, 0.0f, 1.0f};

		if (!fractal->transformCommon.functionEnabledMFalse)
		{
			if (children < 2) p2 = p - (REAL3){2.0f, 0.0f, 0.0f};
		}
		else
		{
			p2 = p - (REAL3){2.0f, 0.0f, 0.0f};
		}
		REAL3 p3 = p - (REAL3){1.0f, 1.0f, 0.0f};
		REAL3 p4 = p; //- (REAL3) {0.0f, 0.0f, 0.0f};
		if (mat_struct == 3)
		{
			if (p.x <= 1.5f)
			{
				// f = (p.x - 1.5f) / aux->DE;
				// on = true;
				break;
			}

			p4 = p - (REAL3){2.0f, 0.0f, 0.0f};
		}

		REAL d1, d2, d3, d4;
		d1 = dot(p1, p1);
		d2 = dot(p2, p2);
		d3 = dot(p3, p3);
		d4 = dot(p4, p4);

		if (d1 < d2 && d1 < d3 && d1 < d4)
		{
			p = p1;
			ColV.x = 1.0f;
		}
		else if (d2 < d1 && d2 < d3 && d2 < d4)
		{
			p = p2;
			ColV.y = 1.0f;
		}
		else if (d3 < d1 && d3 < d2 && d3 < d4)
		{
			p = p3;
			ColV.z = 1.0f;
		}
		else if (mat_struct >= 2)
		{
			p = p4;
			ColV.w = 1.0f;
			if (mat_struct == 2)
			{
				p *= scale;
				aux->DE *= scale;
				break;
			}
		}
		p *= scale;
		aux->DE *= scale;

		// DE tweaks
		aux->DE = aux->DE * fractal->analyticDE.scale1 + fractal->analyticDE.offset0;

		if (fractal->foldColor.auxColorEnabled && n >= fractal->foldColor.startIterationsA
				&& n < fractal->foldColor.stopIterationsA)
		{
			col += ColV.x * fractal->foldColor.difs0000.x + ColV.y * fractal->foldColor.difs0000.y
						 + ColV.z * fractal->foldColor.difs0000.z + ColV.w * fractal->foldColor.difs0000.w;
			//	if (fractal->foldColor.difs1 > dist) col += fractal->foldColor.difs0000.w;
		}
	}

	z = (REAL4){p.x, p.y, p.z, z.w};

	if (!fractal->transformCommon.functionEnabledSwFalse)
	{
		d = min(min_dist,
			(max(fabs(p.x), max(fabs(p.y), fabs(p.z))) - fractal->transformCommon.offset105) / aux->DE);
	}
	else
	{
		d = (length(z) - fractal->transformCommon.offset105) / aux->DE;
	}

	if (fractal->transformCommon.functionEnabledCFalse)
	{
		REAL dst1 = length(aux->const_c) - fractal->transformCommon.offsetR1;
		d = max(d, dst1);
		d = fabs(d);
	}

	if (!fractal->transformCommon.functionEnabledXFalse)
		aux->dist = min(aux->dist, d);
	else
		aux->dist = d;

	if (fractal->analyticDE.enabledFalse) z = oldZ;

	aux->color = col;
	return z;
}