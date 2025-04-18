/**
 * Mandelbulber v2, a 3D fractal generator  _%}}i*<.        ____                _______
 * Copyright (C) 2025 Mandelbulber Team   _>]|=||i=i<,     / __ \___  ___ ___  / ___/ /
 *                                        \><||i|=>>%)    / /_/ / _ \/ -_) _ \/ /__/ /__
 * This file is part of Mandelbulber.     )<=i=]=|=i<>    \____/ .__/\__/_//_/\___/____/
 * The project is licensed under GPLv3,   -<>>=|><|||`        /_/
 * see also COPYING file in this folder.    ~+{i%+++
 *
 * amazing ifs based on Mandelbulber3D.
 * @reference
 * http://www.fractalforums.com/mandelbulb-3d/custom-formulas-and-transforms-release-t17106/

 * This file has been autogenerated by tools/populateUiInformation.php
 * from the file "fractal_transf_difs_amazing_ifs.cpp" in the folder formula/definition
 * D O    N O T    E D I T    T H I S    F I L E !
 */

REAL4 TransfDIFSAmazingIfsIteration(REAL4 z, __constant sFractalCl *fractal, sExtendedAuxCl *aux)
{
	if (fractal->transformCommon.functionEnabledAFalse)
	{
		if (fractal->transformCommon.functionEnabledAxFalse) z.x = fabs(z.x);
		if (fractal->transformCommon.functionEnabledAyFalse) z.y = fabs(z.y);
		if (fractal->transformCommon.functionEnabledAzFalse) z.z = fabs(z.z);
	}

	z += fractal->transformCommon.offsetA000;

	REAL4 oldZ = z;
	z.x = fabs(z.x + fractal->transformCommon.additionConstant0555.x)
				- fabs(z.x - fractal->transformCommon.additionConstant0555.x) - z.x;
	z.y = fabs(z.y + fractal->transformCommon.additionConstant0555.y)
				- fabs(z.y - fractal->transformCommon.additionConstant0555.y) - z.y;
	if (fractal->transformCommon.functionEnabledJFalse)
		z.z = fabs(z.z + fractal->transformCommon.additionConstant0555.z)
					- fabs(z.z - fractal->transformCommon.additionConstant0555.z) - z.z;
	REAL4 zCol = z;

	REAL rr = dot(z, z);
	REAL rrCol = rr;
	REAL RR = fractal->transformCommon.minR2p25;
	if (rr < RR)
	{
		RR = 1.0f / RR;
		z *= RR;
		aux->DE *= RR;
	}
	else if (rr < 1.0f)
	{
		RR = 1.0f / rr;
		z *= RR;
		aux->DE *= RR;
	}

	// scale
	if (fractal->transformCommon.functionEnabledSFalse)
	{
		z *= fractal->transformCommon.scale015;
		aux->DE = aux->DE * fabs(fractal->transformCommon.scale015) + fractal->analyticDE.offset0;
	}

	z = Matrix33MulFloat4(fractal->transformCommon.rotationMatrix2, z);

	if (fractal->transformCommon.functionEnabledRFalse)
	{
		REAL temp = 0.0f;
		if (fractal->transformCommon.angleDegC != 0.0f)
		{
			temp = z.x;
			z.x = z.x * fractal->transformCommon.cosC - z.y * fractal->transformCommon.sinC;
			z.y = temp * fractal->transformCommon.sinC + z.y * fractal->transformCommon.cosC;
		}
		if (fractal->transformCommon.angleDegB != 0.0f)
		{
			temp = z.z;
			z.z = z.z * fractal->transformCommon.cosB - z.x * fractal->transformCommon.sinB;
			z.x = temp * fractal->transformCommon.sinB + z.x * fractal->transformCommon.cosB;
		}
		if (fractal->transformCommon.angleDegA != 0.0f)
		{
			temp = z.y;
			z.y = z.y * fractal->transformCommon.cosA - z.z * fractal->transformCommon.sinA;
			z.z = temp * fractal->transformCommon.sinA + z.z * fractal->transformCommon.cosA;
		}
	}

	// DE
	REAL colDist = aux->dist; // for color
	aux->DE0 = length(z) / aux->DE;
	if (!fractal->analyticDE.enabledFalse) aux->DE0 = min(aux->dist, aux->DE0);
	aux->dist = aux->DE0;

	// aux->color
	if (fractal->foldColor.auxColorEnabled && aux->i >= fractal->foldColor.startIterationsA
			&& aux->i < fractal->foldColor.stopIterationsA)
	{
		REAL colorAdd = 0.0f;
		if (fractal->foldColor.auxColorEnabledA)
			if (colDist != aux->dist) colorAdd += fractal->foldColor.difs1;

		if (fractal->foldColor.auxColorEnabledFalse)
		{
			if (zCol.x != oldZ.x)
				colorAdd += fractal->foldColor.difs0000.x
										* (fabs(zCol.x) - fractal->transformCommon.additionConstant111.x);
			if (zCol.y != oldZ.y)
				colorAdd += fractal->foldColor.difs0000.y
										* (fabs(zCol.y) - fractal->transformCommon.additionConstant111.y);
			if (zCol.z != oldZ.z)
				colorAdd += fractal->foldColor.difs0000.z
										* (fabs(zCol.z) - fractal->transformCommon.additionConstant111.z);
			if (rrCol > fractal->transformCommon.minR2p25)
				colorAdd +=
					fractal->foldColor.difs0000.w * (rrCol - fractal->transformCommon.minR2p25) / 100.0f;
		}
		aux->color += colorAdd;
	}
	return z;
}