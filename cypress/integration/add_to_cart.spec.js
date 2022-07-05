describe("add to cart test", () => {
  it("directs the user to the homepage", () => {
    cy.visit("/");
  });
  it("adds an item to the cart when user hits 'add' button on item", () => {
    cy.visit("/");
    cy.contains("Add").first().click({ force: true });
    cy.get("#cart").should("contain", "1");
  });
});
