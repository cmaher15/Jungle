describe("Product tests", () => {
  it("directs the user to the homepage", () => {
    cy.visit("/");
  });
  it("directs user to product page when product partial is clicked", () => {
    cy.visit("/");
    cy.get(".product_link").first().click();
    cy.url().should("include", "/products/2");
  });
});
