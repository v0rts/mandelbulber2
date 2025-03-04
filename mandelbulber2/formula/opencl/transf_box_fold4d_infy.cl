/**
 * Mandelbulber v2, a 3D fractal generator  _%}}i*<.        ____                _______
 * Copyright (C) 2024 Mandelbulber Team   _>]|=||i=i<,     / __ \___  ___ ___  / ___/ /
 *                                        \><||i|=>>%)    / /_/ / _ \/ -_) _ \/ /__/ /__
 * This file is part of Mandelbulber.     )<=i=]=|=i<>    \____/ .__/\__/_//_/\___/____/
 * The project is licensed under GPLv3,   -<>>=|><|||`        /_/
 * see also COPYING file in this folder.    ~+{i%+++
 *
 * Box Fold 4d Inf (_FoldingInfy)
 * Continuous, seamless folding of 4D space. Boxtiling "enhanced" version.
 * from M3D. Baded on formula by Luca GN 2011,
 * @reference
 * http://www.fractalforums.com/mandelbulb-3d/custom-formulas-and-transforms-release-t17106/

 * This file has been autogenerated by tools/populateUiInformation.php
 * from the file "fractal_transf_box_fold4d_infy.cpp" in the folder formula/definition
 * D O    N O T    E D I T    T H I S    F I L E !
 */

REAL4 TransfBoxFold4dInfyIteration(REAL4 z, __constant sFractalCl *fractal, sExtendedAuxCl *aux)
{
	// REAL4 oldZ = z;
	REAL4 size = fractal->transformCommon.offset2222;
	REAL4 m = size * fractal->transformCommon.scale4;

	if (!fractal->transformCommon.functionEnabledFalse)
	{
		if (fractal->transformCommon.functionEnabledx && size.x != 0.0f)
		{
			z.x -= round(z.x / m.x) * m.x;
			z.x = fabs(z.x + size.x) - fabs(z.x - size.x) - z.x;
		}
		if (fractal->transformCommon.functionEnabledyFalse && size.y != 0.0f)
		{
			z.y -= round(z.y / m.y) * m.y;
			z.y = fabs(z.y + size.y) - fabs(z.y - size.y) - z.y;
		}
		if (fractal->transformCommon.functionEnabledzFalse && size.z != 0.0f)
		{
			z.z -= round(z.z / m.z) * m.z;
			z.z = fabs(z.z + size.z) - fabs(z.z - size.z) - z.z;
		}
		if (fractal->transformCommon.functionEnabledwFalse && size.w != 0.0f)
		{
			z.w -= round(z.w / m.w) * m.w;
			z.w = fabs(z.w + size.w) - fabs(z.w - size.w) - z.w;
		}
	}
	else
	{
		REAL4 repeatPos = fractal->transformCommon.offsetA1111 * 0.5f;
		REAL4 repeatNeg = fractal->transformCommon.offsetB1111 * 0.5f;

		if (fractal->transformCommon.functionEnabledx && (z.x < (repeatPos.x + 0.5f) * m.x - size.x)
				&& (z.x > (repeatNeg.x + 0.5f) * -m.x + size.x) && (size.x != 0.0f))
		{
			z.x -= round(z.x / m.x) * m.x;
			z.x = fabs(z.x + size.x) - fabs(z.x - size.x) - z.x;
		}
		if (fractal->transformCommon.functionEnabledyFalse
				&& (z.y < (repeatPos.y + 0.5f) * m.y - size.y)
				&& (z.y > (repeatNeg.y + 0.5f) * -m.y + size.y) && (size.y != 0.0f))
		{
			z.y -= round(z.y / m.y) * m.y;
			z.y = fabs(z.y + size.y) - fabs(z.y - size.y) - z.y;
		}
		if (fractal->transformCommon.functionEnabledzFalse
				&& (z.z < (repeatPos.z + 0.5f) * m.z - size.z)
				&& (z.z > (repeatNeg.z + 0.5f) * -m.z + size.z) && (size.z != 0.0f))
		{
			z.z -= round(z.z / m.z) * m.z;
			z.z = fabs(z.z + size.z) - fabs(z.z - size.z) - z.z;
		}
		if (fractal->transformCommon.functionEnabledwFalse
				&& (z.w < (repeatPos.w + 0.5f) * m.w - size.w)
				&& (z.w > (repeatNeg.w + 0.5f) * -m.w + size.w) && size.w != 0.0f)
		{
			z.w -= round(z.w / m.w) * m.w;
			z.w = fabs(z.w + size.w) - fabs(z.w - size.w) - z.w;
		}
	}

	if (fractal->analyticDE.enabled)
	{
		aux->DE = aux->DE * fractal->analyticDE.scale1 + fractal->analyticDE.offset0;
	}

	if (fractal->transformCommon.addCpixelEnabledFalse) aux->const_c = z;
	return z;
}