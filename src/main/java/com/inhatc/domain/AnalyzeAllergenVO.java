package com.inhatc.domain;

public class AnalyzeAllergenVO {
	
	private String ingredient;
	private int ingredientCount;
	private int maxCount;
	private double percent;
	
	@Override
	public String toString() {
		return "AnalyzeAllergenVO [ingredient=" + ingredient + ", ingredientCount=" + ingredientCount + ", maxCount=" + maxCount
				+ ", percent=" + percent + "]";
	}
	public String getIngredient() {
		return ingredient;
	}
	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}
	public int getIngredientCount() {
		return ingredientCount;
	}

	public void setIngredientCount(int ingredientCount) {
		this.ingredientCount = ingredientCount;
	}

	public int getMaxCount() {
		return maxCount;
	}

	public void setMaxCount(int maxCount) {
		this.maxCount = maxCount;
	}
	public double getPercent() {
		return percent;
	}
	public void setPercent(double percent) {
		this.percent = percent;
	}
	
}
