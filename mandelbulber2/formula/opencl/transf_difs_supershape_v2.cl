/**
 * Mandelbulber v2, a 3D fractal generator  _%}}i*<.        ____                _______
 * Copyright (C) 2021 Mandelbulber Team   _>]|=||i=i<,     / __ \___  ___ ___  / ___/ /
 *                                        \><||i|=>>%)    / /_/ / _ \/ -_) _ \/ /__/ /__
 * This file is part of Mandelbulber.     )<=i=]=|=i<>    \____/ .__/\__/_//_/\___/____/
 * The project is licensed under GPLv3,   -<>>=|><|||`        /_/
 * see also COPYING file in this folder.    ~+{i%+++
 *
 * TransfDifsCylinderIteration  fragmentarium code, mdifs by knighty (jan 2012)
 * and http://www.iquilezles.org/www/articles/distfunctions/distfunctions.htm

 * This file has been autogenerated by tools/populateUiInformation.php
 * from the file "fractal_transf_difs_cylinder.cpp" in the folder formula/definition
 * D O    N O T    E D I T    T H I S    F I L E !
 */

REAL4 TransfDIFSSupershapeV2Iteration(REAL4 z, __constant sFractalCl *fractal, sExtendedAuxCl *aux)
{

	if (fractal->transformCommon.functionEnabledPFalse
			&& aux->i >= fractal->transformCommon.startIterationsP
			&& aux->i < fractal->transformCommon.stopIterationsP1)
	{
		if (fractal->transformCommon.functionEnabledBxFalse)
		{
			z.x = sign(z.x) * (fractal->transformCommon.offset000.x - fabs(z.x));
		}
		if (fractal->transformCommon.functionEnabledByFalse)
		{
			z.y = sign(z.y) * (fractal->transformCommon.offset000.y - fabs(z.y));
		}
		if (fractal->transformCommon.functionEnabledBzFalse)
		{
			z.z = sign(z.z) * (fractal->transformCommon.offset000.z - fabs(z.z));
		}
	}
	REAL r1;
	REAL phi;
	if (!fractal->transformCommon.functionEnabledAFalse)
		phi = atan2(z.x, z.y);
	else
		phi = atan2(z.y, z.x);

	REAL t1 = fabs(native_cos(fractal->transformCommon.constantMultiplierA111.x * phi)
								 * fractal->transformCommon.constantMultiplierA111.y);
	if (fractal->transformCommon.functionEnabledXFalse)
		t1 = pow(t1, fractal->transformCommon.constantMultiplierB111.x);

	REAL t2 = fabs(native_sin(fractal->transformCommon.constantMultiplierA111.x * phi)
								 * fractal->transformCommon.constantMultiplierA111.z);
	if (fractal->transformCommon.functionEnabledYFalse)
		t2 = pow(t2, fractal->transformCommon.constantMultiplierB111.y);

	if (!fractal->transformCommon.functionEnabledEFalse)
		r1 = (t1 + t2);
	else
		r1 = pow(t1 + t2, fractal->transformCommon.constantMultiplierB111.z);

	if (!fractal->transformCommon.functionEnabledFFalse) r1 = 1.0f / r1;
	REAL4 zc = z;
	REAL rb = native_sqrt(z.x * z.x + z.y * z.y);
	zc.x = r1 * native_cos(phi);
	zc.y = r1 * native_sin(phi);

	REAL xyR = rb - native_sqrt(zc.x * zc.x + zc.y * zc.y) - fractal->transformCommon.offsetR0;

	REAL cylR = xyR;
	if (fractal->transformCommon.functionEnabledFalse)
	{
		cylR = fabs(cylR) - fractal->transformCommon.offset0;
		cylR = max(cylR, xyR);
	}
	REAL cylH = fabs(zc.z) - fractal->transformCommon.offsetA1;

	cylR = max(cylR, 0.0f);
	cylH = max(cylH, 0.0f);
	REAL cylD = native_sqrt(cylR * cylR + cylH * cylH);
	cylD = min(max(cylR, cylH), 0.0f) + cylD;
	REAL colDist = aux->dist;
	aux->dist = min(aux->dist, cylD / (aux->DE + 1.0f));

	if (fractal->foldColor.auxColorEnabledFalse
			&& aux->i >= fractal->foldColor.startIterationsA
			&& aux->i < fractal->foldColor.stopIterationsA)
	{
		if (colDist != aux->dist) aux->color += fractal->foldColor.difs0000.x;

		if (fractal->foldColor.auxColorEnabledAFalse)
		{
			if (fractal->transformCommon.offsetA1 < fabs(zc.z))
				aux->color += fractal->foldColor.difs0000.y;
			if (xyR < -fractal->transformCommon.offset0)
				aux->color += fractal->foldColor.difs0000.z;
			//if (fractal->transformCommon.offsetA1 - fractal->foldColor.difs0 < fabs(zc.z))
			//	aux->color += fractal->foldColor.difs0000.w;
		}
	}
	return z;
}